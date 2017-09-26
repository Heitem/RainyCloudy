//
//  Constants.swift
//  RainyShinyCloudy
//
//  Created by Heitem OULED-LAGHRIYEB on 9/12/17.
//  Copyright © 2017 Heitem OULED-LAGHRIYEB. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/"
let WEATHER_URL = "weather?"
let FORECAST_URL = "forecast/daily?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let NUMBER_OF_DAYS = "&cnt=10"
let UNITS = "&units=metric"
let APP_ID = "&appid="
let API_KEY = "ae90f5fdad987e62c80c88d09a8edd1a"

typealias DownloadComplete = () -> ()


let CURRENT_WEATHER_URL = "\(BASE_URL)\(WEATHER_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(UNITS)\(APP_ID)\(API_KEY)"
let CURRENT_FORECAST_URL = "\(BASE_URL)\(FORECAST_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(UNITS)\(NUMBER_OF_DAYS)\(APP_ID)\(API_KEY)"
