//
//  CurrentWeatherAPI.swift
//  RainyShinyCloudy
//
//  Created by Heitem OULED-LAGHRIYEB on 11/16/17.
//  Copyright © 2017 Heitem OULED-LAGHRIYEB. All rights reserved.
//

import Foundation
import Moya

enum CurrentWeatherAPI {
  case currentWeather
}

extension CurrentWeatherAPI: TargetType {
  
  var baseURL:URL{ return Configuration().baseURL }
  
  var path: String {
    switch self {
    case .currentWeather:
      return "/weather"
    }
  }
  
  var method: Moya.Method {
    switch self {
      case .currentWeather:
        return .get
      
    }
  }
  
  var parameters: [String : Any]? {
    
    switch self {
    case .currentWeather:
        let params = ["lat": Location.sharedInstance.latitude, "lon": Location.sharedInstance.longitude, "appid": Configuration.init().appID, "units": "metric"] as [String : Any]
      return params
    }
  }
  
  var validate: Bool {
    return true
  }
  
  var parameterEncoding: ParameterEncoding {
    
    switch self {
    case .currentWeather:
      return URLEncoding.default
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    
    if let params = self.parameters {
      return .requestParameters(parameters: params, encoding: parameterEncoding)
    } else {
      return .requestPlain
    }
  }
  
}
  
extension CurrentWeatherAPI {
  
    var headers: [String: String]? {
      return nil
    }
  
    var plugins : [PluginType] {
      var plugins = [PluginType]()
      plugins.insert(NetworkLoggerPlugin(), at: 0)
      return plugins
    }
}
