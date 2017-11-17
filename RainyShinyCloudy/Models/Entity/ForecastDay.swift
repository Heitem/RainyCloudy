//
//  Forecast.swift
//  RainyShinyCloudy
//
//  Created by Heitem OULED-LAGHRIYEB on 9/14/17.
//  Copyright © 2017 Heitem OULED-LAGHRIYEB. All rights reserved.
//

import UIKit
import ObjectMapper

class ForecastDay: Mappable {
  
    var date: Double = 0.0
    var weatherType: String = ""
    var highTemp: Double = 0.0
    var lowTemp: Double = 0.0
  
    required convenience init(map: Map) {
      self.init()
        mapping(map: map)
    }
  
    // Mappable
    func mapping(map: Map) {
      
        date <- map["dt"]
        weatherType <- map["weather.0.main"]
        highTemp <- map["temp.max"]
        lowTemp <- map["temp.min"]
    }
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
