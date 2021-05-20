//
//  Avatar.swift
//  real estate
//
//  Created by jcarloabanto on 5/20/21.
//

import Foundation

struct Avatar: Codable {
    let small: ImageSize
    let medium: ImageSize
    let large: ImageSize
}

struct ImageSize: Codable {
    let url: String
}

