//
//  Agent.swift
//  real estate
//
//  Created by jcarloabanto on 5/20/21.
//

import Foundation


struct Agent: Codable {
    let firstName, lastName, companyName: String
    let avatar: Avatar
    
    enum CodingKeys: String, CodingKey {
        case avatar
        case firstName = "first_name"
        case lastName = "last_name"
        case companyName = "company_name"
    }
}
