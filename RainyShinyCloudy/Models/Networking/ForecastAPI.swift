//
//  ForecastAPI.swift
//  RainyShinyCloudy
//
//  Created by Heitem OULED-LAGHRIYEB on 11/16/17.
//  Copyright © 2017 Heitem OULED-LAGHRIYEB. All rights reserved.
//

import Foundation
import Moya

enum ForecastAPI {
  case forecast
}

extension ForecastAPI: TargetType {
  
  var baseURL:URL{ return Configuration().baseURL }
  
  var path: String {
    switch self {
    case .forecast:
      return "/forecast/daily"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .forecast:
      return .get
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var parameters: [String : Any]? {
    
    switch self {
    case .forecast:
      let params = ["q": "sale", "appid": Configuration.init().appID, "units": "metric", "cnt": "10"]
      return params
    }
  }
  
  var validate: Bool {
    return true
  }
  
  var parameterEncoding: ParameterEncoding {
    
    switch self {
    case .forecast:
      return URLEncoding.default
    }
  }
  
  var task: Task {
    
    if let params = self.parameters {
      return .requestParameters(parameters: params, encoding: parameterEncoding)
    } else {
      return .requestPlain
    }
  }
  
}

extension ForecastAPI {
  
  var headers: [String: String]? {
    return nil
  }
  
  var plugins : [PluginType] {
    var plugins = [PluginType]()
    plugins.insert(NetworkLoggerPlugin(), at: 0)
    return plugins
  }
}

