//
//  Extension.swift
//  Droolicity
//
//  Created by Abdelmajid Rajad on 9/21/17.
//  Copyright © 2017 Hidden founders. All rights reserved.
//

import Foundation
import SwiftyJSON
import PromiseKit
import ObjectMapper
import Moya
extension ImmutableMappable {
    
    init(json: JSON) throws {
            try self.init(JSONString: json.description)
        }
    static func collection(from json: JSON) throws -> [Self] {
        
        var objects = [Self]()
        
        guard let array = json.array else {
            let _ = try Self.init(json: JSON([:])) // Trigger exception
            return []
        }
        
        for json in array {
            objects.append(try Self.init(json: json))
        }
        return objects
    }
}
extension Promise {
    func map<U>(transform: @escaping (T) throws -> U) -> Promise<U> {
        
        return self.then { value in
            
            do {
                let transformedValue = try transform(value)
                return Promise<U>(value: transformedValue)
            } catch let error {
                print("Mapping to \(U.self) failed \(error)")
                throw error
            }
            
        }
        
    }
    
}

extension TargetType {
    var plugins : [PluginType] {
        var plugins = [PluginType]()
        plugins.insert(NetworkLoggerPlugin(), at: 0)
        return plugins
    }
}
// alert extension : used for test
extension UIAlertController {
    class func showAlert(context: UIViewController,title : String,message : String){
        let alertController = UIAlertController(title: title  , message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Close", style: .cancel) { _ in
            context.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(dismissAction)
        context.present(alertController, animated: true, completion: nil)
    }
}


