//
//  RouteViewModel.swift
//  Finch Station
//
//  Created by Jeniean on 02/06/2020.
//  Copyright © 2020 Jens Las Pobres. All rights reserved.
//

import Foundation
import RealmSwift


var routes : Results<Route> {
    get {
        RealmManager.realm!.objects(Route.self)
    }
}


class RouteViewModel {
    
    private let route: Route
    
    init(route: Route) {
        self.route = route
    }
    
    func formattedString(text:String, value:String) -> NSMutableAttributedString {
        let formattedString = NSMutableAttributedString()
            formattedString
                .customTextWithColor(text: text , size: 16.0, fontName: "HelveticaNeue", .lightGray)
                .customTextWithColor(text: value , size: 16.0, fontName: "HelveticaNeue", .black)
        return formattedString
    }
    
    public var routeName: NSMutableAttributedString {
        return formattedString(text:"ROUTE NAME: ", value:route.name)
    }
    
    public var routeURI: NSMutableAttributedString {
        return formattedString(text:"ROUTE URI: ", value:route.uri)
    }
    
    public var routeGroupID: NSMutableAttributedString {
        return formattedString(text:"ROUTE GROUP ID: ", value:route.groupID)
    }
    
}
