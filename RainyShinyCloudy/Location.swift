//
//  Location.swift
//  RainyShinyCloudy
//
//  Created by Heitem OULED-LAGHRIYEB on 9/15/17.
//  Copyright © 2017 Heitem OULED-LAGHRIYEB. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    
    static var sharedInstance = Location()
    
    private init(){}
    
    var latitude: Double!
    var longitude: Double!
}
