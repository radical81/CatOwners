//
//  ViewController.swift
//  CatOwners
//
//  Created by Rex Jason Alobba on 2/3/18.
//  Copyright © 2018 Rex Jason Alobba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//             testRunData() // For debugging URL call
    }

    func testRunData() {
        let api = APIManager()
        api.loadData(PET_SOURCE, completion: didLoadData)
    }
    
    func didLoadData(_ items: [Owner]) {
        for item in items {
            print("name = \(item.name!)")
            print("gender = \(item.gender!)")
            print("age = \(item.age!)")
            for p in item.pets! {
                print("pet = \(p.name!) the \(p.kind!)")
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

