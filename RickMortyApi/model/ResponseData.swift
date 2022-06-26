//
//  ResponseData.swift
//  RickMortyApi
//
//  Created by Yuliia Khrupina on 6/26/22.
//

import Foundation
import ObjectMapper

class ResponseData: Mappable {
    
    var results: Array<Character> = []
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        results <- map["results"]
    }
}

class Character: Mappable {
    
    var id: String? = nil
    var name: String? = nil
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}
