//
//  CurrentWeatherService.swift
//  RainyShinyCloudy
//
//  Created by Heitem OULED-LAGHRIYEB on 11/16/17.
//  Copyright © 2017 Heitem OULED-LAGHRIYEB. All rights reserved.
//

import Foundation
import PromiseKit

struct CurrentWeatherService {
  
  static let instance = CurrentWeatherService()
  
  func currentWeather() -> Promise<CurrentWeather> {
    
    return NetworkManager<CurrentWeatherAPI>.request(target: .currentWeather).map {
      try CurrentWeather(json: $0)
    }
  }
}
