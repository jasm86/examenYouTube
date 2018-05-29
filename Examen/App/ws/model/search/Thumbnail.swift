//
//  Thumbnail.swift
//  Examen
//
//  Created by jasanchezm on 5/27/18.
//  Copyright © 2018 jasanchezm. All rights reserved.
//

import Foundation
import ObjectMapper

class Thumbnail: Mappable{
    var url : String?
    var width : Int?
    var height : Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        url <- map["url"]
        width <- map["width"]
        height <- map["height"]
    }
}
