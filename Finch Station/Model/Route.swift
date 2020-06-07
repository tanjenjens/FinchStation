//
//  Route.swift
//  Finch Station
//
//  Created by Jeniean on 02/06/2020.
//  Copyright © 2020 Jens Las Pobres. All rights reserved.
//

import Foundation
import RealmSwift


class Route: Object {
    
    @objc dynamic var uri = ""
    @objc dynamic var groupID = ""
    @objc dynamic var name = ""
    @objc dynamic var station = ""
    @objc dynamic var agency = ""
    var stopTimes = List<StopTime>()
    
    convenience init(route:SwiftDictionary, stop:SwiftDictionary) {
        
        self.init()
        self.uri = route["uri"] as? String ?? ""
        self.groupID = route["route_group_id"] as? String ?? ""
        self.name = route["name"] as? String ?? ""
        self.station = stop["name"] as? String ?? ""
        self.agency = stop["agency"] as? String ?? ""
        
        let stopList = List<StopTime>()
        if let data = route["stop_times"] as? [SwiftDictionary] {
            for (_,item) in data.enumerated() {
                let stopTime = StopTime.init(data:item)
                stopList.append(stopTime)
            }
        }
        self.stopTimes = stopList
    }
    
    override static func primaryKey() -> String? {
        return "uri"
    }
    
}
