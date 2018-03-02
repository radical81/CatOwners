//
//  Owner.swift
//  CatOwners
//
//  Created by Rex Jason Alobba on 2/3/18.
//  Copyright © 2018 Rex Jason Alobba. All rights reserved.
//

import Foundation


class Owner: Codable {
    var name : String?
    var gender: String?
    var age: Int?
    var pets: [Pet]?
    
    func generatePets(data: [[String: String]]) -> [Pet]? {
        var petArray = [Pet]()
        for d: [String: String] in data {
            petArray.append(Pet(json: d)!)
        }
        return petArray
    }
    
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
        if let jsonPets = json["pets"] as? [[String: String]] {
            if let pets = generatePets(data: jsonPets) {
                self.pets = pets
            }
        }
        else {
            return nil
        }
        self.name = name
        self.gender = gender
        self.age = age
    }
}
