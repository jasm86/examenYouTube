//
//  snippet.swift
//  Examen
//
//  Created by jasanchezm on 5/27/18.
//  Copyright © 2018 jasanchezm. All rights reserved.
//

import Foundation
import ObjectMapper

class Snippet : Mappable{
    
    var publishedAt : String?
    var channelId : String?
    var title : String?
    var description : String?
    var thumbnails : Thumbnails?
    var channelTitle : String?
    var liveBroadcastContent : String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        publishedAt <- map["publishedAt"]
        channelId <- map["channelId"]
        title <- map["title"]
        description <- map["description"]
        thumbnails <- map["thumbnails"]
        channelTitle <- map["channelTitle"]
        liveBroadcastContent <- map["liveBroadcastContent"]
    }
}
