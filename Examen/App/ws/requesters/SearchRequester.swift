//
//  SearchRequester.swift
//  Examen
//
//  Created by jasanchezm on 5/27/18.
//  Copyright © 2018 jasanchezm. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class SearchRequester{
    
    static func searchVideo(for text:String, callback : @escaping (Error?,[ItemSearch]?)->Void){
        let parameters: Parameters = ["q":text ,"maxResults": "10","part": "snippet","key" : "AIzaSyDP2-iLj0RpCAIRES8lRQOhmVqyWy41ZRs","type": "video"]
        
        let url = WSInterface.Paths.google + WSInterface.Endpoints.search
        print(parameters)
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default).responseJSON{ response in
            switch response.result {
            case .success:
                do {
                    if let json = try JSONSerialization.jsonObject(with: response.data!, options: [])as? NSDictionary{
                        let responseUser = Mapper<ResponseSearch>().map(JSONObject: json)
                        callback(nil,responseUser?.items)
                    }
                }catch{
                    callback(WSInterface.Errors.RequestError,nil)
                }
            case .failure(let error):
                print(error)
                callback(WSInterface.Errors.NetworkError,nil)
            }
        }
    }
}
