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
        
        let maleOwners = data.filter{$0.gender?.lowercased() == gender.lowercased()}
        for m in maleOwners {
            if let mPets : [Pet] = m.pets {
                for pet in mPets {
                    if(pet.kind?.lowercased() == kind.lowercased()) {
                        malePets.append(pet)
                    }
                }
            }
        }
        return malePets
    }

    
    func sortPetsByName(ascending:Bool, data: [Pet])->[Pet] {
        if(ascending == true) {
            return data.sorted(by: {$0.name!.lowercased() < $1.name!.lowercased()})
        }
        return data.sorted(by: {$0.name!.lowercased() > $1.name!.lowercased()})
    }
}
