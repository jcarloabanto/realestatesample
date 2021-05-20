//
//  PropertyViewModel.swift
//  real estate
//
//  Created by jcarloabanto on 5/20/21.
//

import Foundation
import UIKit

struct PropertyViewModel {
    let id: String
    let agentName, companyName: String
    let displayPrice: String
    let address: String
    let bedCount: String
    let bathCount: String
    let carCount: String
    let agentImageUrl: URL?
    let properyImageUrl: URL?
    
    init(property: PropertyData) {
        self.id = "Property id: \(property.id)"
        self.companyName = property.agent.companyName
        self.agentName = "\(property.agent.firstName) \(property.agent.lastName)"
        self.agentImageUrl = URL(string: property.agent.avatar.small.url)
        self.properyImageUrl = URL(string: property.propertyImage[0].attachment.url)
        self.displayPrice = property.displayPrice
        self.address = property.location.address
        self.bedCount = "\(property.bedroomCount)"
        self.bathCount = "\(property.bathroomCount)"
        self.carCount = "\(property.carspacesCount)"
    }
}
