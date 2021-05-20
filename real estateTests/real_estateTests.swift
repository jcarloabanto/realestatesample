//
//  real_estateTests.swift
//  real estateTests
//
//  Created by jcarloabanto on 5/20/21.
//

import XCTest
@testable import real_estate
class real_estateTests: XCTestCase {

    func testPropertyViewModel() {
        let propertyData = PropertyData(id: "1", currency: "AUD", displayPrice: "320", location: LocationData(address: "1 TEST 2 THIS NSW", state: "NSW", suburb: "THIS"), bedroomCount: 1, bathroomCount: 2, carspacesCount: 3, agent: Agent(firstName: "James", lastName: "Abanto", companyName: "TESTING", avatar: Avatar(small: ImageSize(url: ""), medium: ImageSize(url: ""), large: ImageSize(url: ""))), owner: Owner(firstName: "Renee", lastName: "Shen", avatar: Avatar(small: ImageSize(url: ""), medium: ImageSize(url: ""), large: ImageSize(url: ""))), propertyImage: [PropertyImage(id: 1, attachment:Attachment(url: "git"))])
        
        let propertyViewModel = PropertyViewModel(property: propertyData)
        
        XCTAssertEqual("Property id: \(propertyData.id)", propertyViewModel.id)
        XCTAssertEqual("\(propertyData.agent.firstName) \(propertyData.agent.lastName)", propertyViewModel.agentName)
        
    }

}
