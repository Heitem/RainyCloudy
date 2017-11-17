//
//  Configuration.swift
//  RainyShinyCloudy
//
//  Created by Heitem OULED-LAGHRIYEB on 11/16/17.
//  Copyright © 2017 Heitem OULED-LAGHRIYEB. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Configuration {
  
  fileprivate let data: JSON
  
  init() {
    let filePath = Bundle.main.path(forResource: "Configuration", ofType: "plist") ?? ""
    let data = NSDictionary(contentsOfFile: filePath) ?? [:]
    let json = JSON(data)
    self.data = json
  }
  
}

extension Configuration {
  
  var baseURL: URL {
    return URL(string: data["baseURL"].stringValue)!
  }
  
  var appID: String {
    return data["appID"].stringValue
  }
  
}
