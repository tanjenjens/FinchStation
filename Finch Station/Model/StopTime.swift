//
//  StopTime.swift
//  Finch Station
//
//  Created by Jeniean on 02/06/2020.
//  Copyright © 2020 Jens Las Pobres. All rights reserved.
//

import Foundation
import RealmSwift

class StopTime: Object {
    
    @objc dynamic var shape = ""
    @objc dynamic var departureTime = ""
    @objc dynamic var departureTimestamp = 0
    @objc dynamic var serviceID = 0
    
    convenience init(data:SwiftDictionary) {
        self.init()
        self.shape = data["shape"] as? String ?? ""
        self.departureTime = data["departure_time"] as? String ?? ""
        self.departureTimestamp = data["departure_timestamp"] as? Int ?? 0
        self.serviceID = data["service_id"] as? Int ?? 0
    }

}
