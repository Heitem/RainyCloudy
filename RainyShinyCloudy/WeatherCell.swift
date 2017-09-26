//
//  WeatherCell.swift
//  RainyShinyCloudy
//
//  Created by Heitem OULED-LAGHRIYEB on 9/14/17.
//  Copyright © 2017 Heitem OULED-LAGHRIYEB. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!

    func configureCell(forecast: Forecast) {
        weatherIcon.image = UIImage(named: "\(forecast.weatherType) Mini")
        dayLabel.text = forecast.date
        weatherType.text = forecast.weatherType
        highTemp.text = forecast.highTemp
        lowTemp.text = forecast.lowTemp
    }
}
