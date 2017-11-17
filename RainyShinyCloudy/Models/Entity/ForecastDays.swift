//
//  WeatherDays.swift
//  RainyShinyCloudy
//
//  Created by Heitem OULED-LAGHRIYEB on 11/17/17.
//  Copyright © 2017 Heitem OULED-LAGHRIYEB. All rights reserved.
//

import UIKit
import ObjectMapper

class ForecastDays: ImmutableMappable {
    
    var list: [ForecastDay] = []
    
    required convenience init(map: Map) {
        self.init()
    }
    
    // Mappable
    func mapping(map: Map) {
        
        list <- map["list"]
    }
}

