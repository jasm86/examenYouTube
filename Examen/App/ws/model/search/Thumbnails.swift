//
//  Thumbnails.swift
//  Examen
//
//  Created by jasanchezm on 5/27/18.
//  Copyright © 2018 jasanchezm. All rights reserved.
//

import Foundation
import ObjectMapper

class Thumbnails: Mappable{
    var default_ : Thumbnail?
    var medium : Thumbnail?
    var high : Thumbnail?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        default_ <- map["default"]
        medium <- map["medium"]
        high <- map["high"]
    }
}
