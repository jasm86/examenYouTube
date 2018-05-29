//
//  ResponseSearch.swift
//  Examen
//
//  Created by jasanchezm on 5/27/18.
//  Copyright © 2018 jasanchezm. All rights reserved.
//

import Foundation
import ObjectMapper

class ResponseSearch: Mappable{
    
    var kind : String?
    var etag : Any?
    var nextPageToken : String?
    var prevPageToken : String?
    var regionCode : String?
    var pageInfo : PageInfo?
    var items: [ItemSearch]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        kind <- map["kind"]
        etag <- map["etag"]
        nextPageToken <- map["nextPageToken"]
        prevPageToken <- map["prevPageToken"]
        regionCode <- map["regionCode"]
        pageInfo <- map["pageInfo"]
        items <- map["items"]
    }
    
}
