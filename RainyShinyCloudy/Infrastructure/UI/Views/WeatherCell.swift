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

    func configure(with forecast: ForecastDay) {
        weatherIcon.image = UIImage(named: "\(forecast.weatherType) Mini")
        dayLabel.text = "\(Date(timeIntervalSince1970: forecast.date).dayOfTheWeek())"
        weatherType.text = forecast.weatherType
        highTemp.text = "\(forecast.highTemp) °C"
        lowTemp.text = "\(forecast.lowTemp) °C"
    }
}
