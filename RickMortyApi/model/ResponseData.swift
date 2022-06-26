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
    var status: String? = nil
    var species: String? = nil
    var gender: String? = nil
    var image: String? = nil
    var origin: OriginPlace? = nil
    
    func getOriginName() -> String? {
        return origin?.name
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        status <- map["status"]
        species <- map["species"]
        gender <- map["gender"]
        image <- map["image"]
        origin <- map["origin"]
    }
}

class OriginPlace: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
    }
    
    var name: String? = nil
    
}
