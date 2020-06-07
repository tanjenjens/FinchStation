//
//  Service.swift
//  Finch Station
//
//  Created by Jeniean on 02/06/2020.
//  Copyright © 2020 Jens Las Pobres. All rights reserved.
//

import Foundation
import RealmSwift
import Alamofire

public typealias SwiftDictionary = [String:Any]

class Service {
    
    class func getRoutes(completion: @escaping (Bool?) -> Void) {
        
        guard let url = URL(string: "https://myttc.ca/finch_station.json") else {
            completion(nil)
            return
        }
        
        Alamofire.request(url, method: .get, parameters: nil).validate()
        .responseJSON { response in
            
            guard response.result.isSuccess else {
                completion(false)
                return
            }

            guard let value = response.result.value as? SwiftDictionary,
                let stops = value["stops"] as? [SwiftDictionary] else {
                    completion(false)
                    return
            }
    
            var routes = [Route]()
        
            for stop in stops {
                if let data = stop["routes"] as? [SwiftDictionary] {
                    for item in data {
                        let route = Route.init(route:item, stop:stop)
                        routes.append(route)
                    }
                }
            }
        
            if let savedRoutes = RealmManager.realm?.objects(Route.self), savedRoutes.count > 0 {
                try! RealmManager.realm?.write {
                    RealmManager.realm?.delete(savedRoutes)
                }
            }
        
            RealmManager.save(objects: routes)
            completion(true)
        }
    }
}
