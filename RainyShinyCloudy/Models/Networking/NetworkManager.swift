//
//  NetworkManager.swift
//  RainyShinyCloudy
//
//  Created by Heitem OULED-LAGHRIYEB on 11/16/17.
//  Copyright © 2017 Heitem OULED-LAGHRIYEB. All rights reserved.
//

import Foundation
import Moya
import PromiseKit
import SwiftyJSON

struct NetworkManager<API : TargetType> {
  
  typealias Provider = MoyaProvider<API>
  
  @discardableResult
  static func request(target: API) -> Promise<JSON> {
    
    let (promise, fulfill, reject) = Promise<JSON>.pending()
    
    let provider = Provider(plugins: target.plugins)
    provider.request(target) { result in
      
      switch result {
      case .success(let response):
        
        let json = try? JSON(data: response.data)
        fulfill(json!)
        
      case .failure(let error): reject(error)
      }
      
    }
    
    return promise
    
  }
}
