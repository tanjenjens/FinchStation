//
//  StopTimeViewModel.swift
//  Finch Station
//
//  Created by Jeniean on 07/06/2020.
//  Copyright © 2020 Jens Las Pobres. All rights reserved.
//

import Foundation

class StopTimeViewModel {
    
    private let stopTime: StopTime
    
    init(stopTime: StopTime) {
        self.stopTime = stopTime
    }
    
    func formattedString(text:String, value:String) -> NSMutableAttributedString {
        let formattedString = NSMutableAttributedString()
            formattedString
                .customTextWithColor(text: text , size: 15.0, fontName: "HelveticaNeue", .lightGray)
                .customTextWithColor(text: value , size: 15.0, fontName: "HelveticaNeue", .black)
        return formattedString
    }
    
    public var shape: NSMutableAttributedString {
        return formattedString(text:"SHAPE: ", value:stopTime.shape)
    }
    
    public var departimeTime: NSMutableAttributedString {
        var time = String()
        if stopTime.departureTime.contains("a") {
            time = "\(stopTime.departureTime.dropLast()) AM"
        } else {
            time = "\(stopTime.departureTime.dropLast()) PM"
        }
        return formattedString(text:"DEPARTURE TIME: ", value:time)
    }

    public var departimeTimestamp: NSMutableAttributedString {
        let date = Date(timeIntervalSince1970: TimeInterval(stopTime.departureTimestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "MMMM d, yyyy"
        return formattedString(text:"DEPARTURE DATE: ", value:dateFormatter.string(from: date))
    }
    
    public var serviceID: NSMutableAttributedString {
        return formattedString(text:"SERVICE ID: ", value:String(stopTime.serviceID))
    }
}

