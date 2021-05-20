//
//  Property.swift
//  real estate
//
//  Created by jcarloabanto on 5/20/21.
//

import Foundation

struct Property: Decodable {
    let data: [PropertyData]
}

struct PropertyData: Decodable {
    
    let id, currency, displayPrice: String
    let location: LocationData
    let bedroomCount, bathroomCount, carspacesCount: Int
    let agent: Agent
    let owner: Owner
    let propertyImage: [PropertyImage]
    enum CodingKeys: String, CodingKey {
        
        case agent
        case currency
        case id
        case location
        case owner
        
        case bedroomCount = "bedrooms"
        case bathroomCount = "bathrooms"
        case carspacesCount = "carspaces"
        case displayPrice = "display_price"
        case propertyImage = "property_images"
      }
    
}


struct LocationData: Codable {
    let address: String
    let state: String
    let suburb: String
}

struct PropertyImage: Codable {
    let id: Int
    let attachment: Attachment
}

struct Attachment: Codable {
    let url: String
}


