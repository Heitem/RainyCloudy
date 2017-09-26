//
//  WeatherVC.swift
//  RainyShinyCloudy
//
//  Created by Heitem OULED-LAGHRIYEB on 9/10/17.
//  Copyright © 2017 Heitem OULED-LAGHRIYEB. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationAuthStatus()
        
        currentWeather.downloadWeatherDetails {
            //Setup UI to load downloaded data
            self.downloadForecastData {
                self.updateMainUI()
            }
        }
    }
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            
            print(Location.sharedInstance.latitude, Location.sharedInstance.longitude)
            
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    
    func downloadForecastData(completed: @escaping DownloadComplete) {
        //Downloading forecast weather data for tableview
        let forecastUrl = URL(string: CURRENT_FORECAST_URL)!
        print(CURRENT_FORECAST_URL)
        Alamofire.request(forecastUrl).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                    }
                    self.forecasts.remove(at: 0)
                    self.tableView.reloadData()
                }
            }
            completed()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            
            return cell
        } else {
            return WeatherCell()
        }
    }
    
    func updateMainUI() {
        dateLabel.text = currentWeather.date
        locationLabel.text = currentWeather.cityName
        currentWeatherLabel.text = currentWeather.weatherType
        currentTempLabel.text = "\(currentWeather.currentTemp) °C"
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
        
        print("\(currentWeather.date) | \(currentWeather.currentTemp) | \(currentWeather.cityName) | \(currentWeather.weatherType)")
    }
}

