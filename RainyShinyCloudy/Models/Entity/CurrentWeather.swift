//
//  CurrentWeather.swift
//  RainyShinyCloudy
//
//  Created by Heitem OULED-LAGHRIYEB on 9/12/17.
//  Copyright © 2017 Heitem OULED-LAGHRIYEB. All rights reserved.
//

import ObjectMapper

class CurrentWeather: ImmutableMappable {
  
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
  
    required convenience init(map: Map) throws {
      self.init()
    }
  
    // Mappable
    func mapping(map: Map) {
      
      _cityName <- map["name"]
      _weatherType <- map["weather.0.main"]
      _currentTemp <- map["main.temp"]
    }
}
