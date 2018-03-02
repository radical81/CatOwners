//
//  PetSortHelper.swift
//  CatOwners
//
//  Created by Rex Jason Alobba on 2/3/18.
//  Copyright © 2018 Rex Jason Alobba. All rights reserved.
//

import Foundation

class PetSortHelper {
    
    //Filter owners by male or female
    func filterByGenderAndType(gender: String, kind: String, data: [Owner])->[Pet] {
        var malePets : [Pet] = []
        
        let maleOwners = data.filter{$0.gender == "Male"}
        for m in maleOwners {
            if let mPets : [Pet] = m.pets {
                for pet in mPets {
                    if(pet.kind == kind) {
                        malePets.append(pet)
                    }
                }
            }
        }
        return malePets
    }

    
//    func sortPetsByName(ascending:Bool, data: [Owner])->[Pet] {
//
//    }
}
