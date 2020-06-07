//
//  RealmManager.swift
//  Finch Station
//
//  Created by Jeniean on 02/06/2020.
//  Copyright © 2020 Jens Las Pobres. All rights reserved.
//

import Foundation
import RealmSwift


class RealmManager: NSObject {
    
    static var realm: Realm? {
        do {
            return try Realm(configuration: Realm.Configuration.defaultConfiguration)
        } catch let error {
            print("Error: \(error.localizedDescription)")
            return nil
        }
    }
    
    static func save(object: Object) {
        do {
            try realm?.write {
                realm?.add(object, update: .modified)
            }
        } catch let error {
            print("Error performing write operation: \(error.localizedDescription)")
        }
    }
    
    static func save(objects: [Object]) {
        guard objects.count > 0 else {
            return
        }
        do {
            try realm?.write {
                realm?.add(objects, update: .modified)
            }
        } catch let error {
            print("Error performing write operation: \(error.localizedDescription)")
        }
    }

    static func delete(objects: [Object], completion: ((_ error: Error?) -> Void)? = nil) {
        guard objects.count > 0 else {
            return
        }
        do {
            try realm?.write {
                realm?.delete(objects)
            }
            completion?(nil)
        } catch let error {
            print("Error performing write operation: \(error.localizedDescription)")
            completion?(error)
        }
    }
    
    static func write(operation: ((_ realm: Realm?) -> Void)?) {
        do {
            try realm?.write {
                operation?(realm)
            }
        } catch let error {
            print("Error performing write operation: \(error.localizedDescription)")
        }
    }
    
}
