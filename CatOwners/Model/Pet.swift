//
//  Pet.swift
//  CatOwners
//
//  Created by Rex Jason Alobba on 2/3/18.
//  Copyright © 2018 Rex Jason Alobba. All rights reserved.
//

import Foundation

class Pet: Codable {
    var name: String?
    var kind: String?
    
    init?(json: [String: String]) {
        guard let name = json["name"] else {
            return nil
        }
        guard let kind = json["type"] else {
            return nil
        }
        self.name = name
        self.kind = kind
    }
}
