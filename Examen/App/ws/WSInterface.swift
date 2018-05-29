//
//  WSInterface.swift
//  Examen
//
//  Created by jasanchezm on 5/27/18.
//  Copyright © 2018 jasanchezm. All rights reserved.
//

import Foundation
public class WSInterface{
    struct Paths{
        static let google="https://www.googleapis.com/";
    }
    
    struct Endpoints{
        static let search="youtube/v3/search";
    }
    
    enum Errors : Error, LocalizedError {
        case NetworkError
        case RequestError
        case ServiceError(reason: String )
        
        public var errorDescription: String? {
            switch self {
            case .RequestError:
                return NSLocalizedString("OFFLINE", comment: "sin red")
            case .NetworkError:
                return NSLocalizedString("OFFLINE", comment: "sin red")
            case .ServiceError(let reason):
                return reason
            }
        }
    }
    
    
    enum ResponseCode : Int{
        case succes=1
    }
}
