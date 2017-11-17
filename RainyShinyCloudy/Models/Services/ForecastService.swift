//
//  ForecastService.swift
//  RainyShinyCloudy
//
//  Created by Heitem OULED-LAGHRIYEB on 11/16/17.
//  Copyright © 2017 Heitem OULED-LAGHRIYEB. All rights reserved.
//

import Foundation
import PromiseKit

struct ForecastService {
  
  static let instance = ForecastService()

  func forecast() -> Promise<ForecastDays> {
    
    return NetworkManager<ForecastAPI>.request(target: .forecast).map {
        try ForecastDays(json: $0)
    }
  }
}
