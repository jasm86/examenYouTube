//
//  Id.swift
//  Examen
//
//  Created by jasanchezm on 5/27/18.
//  Copyright © 2018 jasanchezm. All rights reserved.
//

import Foundation
import ObjectMapper

class Id : Mappable{
    
    var kind : String?
    var videoId : String?
    var channelId : String?
    var playListId : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        kind <- map["kind"]
        videoId <- map["videoId"]
        channelId <- map["channelId"]
        playListId <- map["playListId"]
    }
}
