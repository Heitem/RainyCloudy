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

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    var forecasts = [ForecastDay]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationAuthStatus()
      
      CurrentWeatherService.instance.currentWeather().then { currentWeather -> Void in
        
        self.dateLabel.text = currentWeather.date
        self.locationLabel.text = currentWeather.cityName
        self.currentWeatherLabel.text = currentWeather.weatherType
        self.currentTempLabel.text = "\(currentWeather.currentTemp) °C"
        self.currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
        
        print("Heitem: \(currentWeather.date) | \(currentWeather.currentTemp) | \(currentWeather.cityName) | \(currentWeather.weatherType)")
      }
      
      loadForecast()
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
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            let forecast = forecasts[indexPath.row]
            cell.configure(with: forecast)
          
            return cell
        } else {
            return WeatherCell()
        }
    }
  
    func loadForecast() {
      ForecastService.instance.forecast().then { forecast -> Void in
        for day in forecast.list {
            self.forecasts.append(day)
            print("Heitem: \(day.date) | \(day.weatherType) | \(day.highTemp) | \(day.lowTemp)")
        }
        
        self.tableView.reloadData()
      }
    }
}

