//
//  PageInfo.swift
//  Examen
//
//  Created by jasanchezm on 5/27/18.
//  Copyright © 2018 jasanchezm. All rights reserved.
//

import Foundation
import ObjectMapper

class PageInfo: Mappable{
    
    var totalResults : Int?
    var resultsPerPage : Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        totalResults <- map["totalResults"]
        resultsPerPage <- map["resultsPerPage"]
    }
}
