//
//  CatOwnersTests.swift
//  CatOwnersTests
//
//  Created by Rex Jason Alobba on 2/3/18.
//  Copyright © 2018 Rex Jason Alobba. All rights reserved.
//

import XCTest
@testable import CatOwners

class CatOwnersTests: XCTestCase {
    
    let petSortHelper = PetSortHelper()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFilterByGender_given_OwnerListMixed_return_petCatsOfMale() {
        let garf = Pet(json:["name": "Garfield", "type": "cat"])
        let rover = Pet(json: ["name": "Rover", "type": "dog"])
        let heath = Pet(json: ["name": "Heathcliff", "type": "cat"])
        let alf = Pet(json: ["name": "Alf", "type": "cat"])
        let dom = Pet(json: ["name": "Dom", "type": "cat"])

        let bob = Owner(json: ["name": "Bob", "gender": "Male", "age": 40, "pets": [garf!, rover!]])
        let alice = Owner(json: ["name": "Alice", "gender": "Female", "age": 40, "pets": [heath!, alf!]])
        let jean = Owner(json: ["name": "Jean", "gender": "Male", "age": 40, "pets": [dom!]])

        let result = petSortHelper.filterByGenderAndType(gender: "Male", kind: "cat", data: [bob!, alice!, jean!])
            XCTAssertTrue(
                result[0].kind == "cat" &&
                result[0].name == "Garfield" &&
                result[1].kind == "cat" &&
                result[1].name == "Dom" &&
                result.count == 2
            )
    }    
}
