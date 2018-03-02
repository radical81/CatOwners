//
//  Owner.swift
//  CatOwners
//
//  Created by Rex Jason Alobba on 2/3/18.
//  Copyright © 2018 Rex Jason Alobba. All rights reserved.
//

import Foundation


class Owner {
    var name : String?
    var gender: String?
    var age: Int?
    var pets: [Pet]?
    
    init?(json: [String: Any]) {
        guard let name = json["name"] as? String else {
            return nil
        }
        guard let gender = json["gender"] as? String else {
            return nil
        }
        guard let age = json["age"] as? Int else {
            return nil
        }
        guard let pets = json["pets"] as? [Pet] else {
            return nil
        }
        self.name = name
        self.gender = gender
        self.age = age
        self.pets = pets
    }
}
