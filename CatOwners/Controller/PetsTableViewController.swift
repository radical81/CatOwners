//
//  PetsTableViewController.swift
//  CatOwners
//
//  Created by Rex Jason Alobba on 3/3/18.
//  Copyright © 2018 Rex Jason Alobba. All rights reserved.
//

import UIKit

class PetsTableViewController: UITableViewController {

    var petListMale = [Pet]()
    var petListFemale = [Pet]()
    let petHelper = PetSortHelper()
    
    fileprivate struct storyboard {
        static let cellReuseIdentifier = "petCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(PetsTableViewController.appBecomeActive), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
        runData()
    }

    @objc func appBecomeActive() {
        runData()
    }

    func runData() {
        let api = APIManager()
        api.loadData(PET_SOURCE, completion: didLoadData)
    }
    
    func didLoadData(_ items: [Owner]) {
        self.petListMale = petHelper.sortPetsByName(ascending: true, data: petHelper.filterByGenderAndType(gender: "Male", kind: "Cat", data: items))
        self.petListFemale = petHelper.sortPetsByName(ascending: true, data: petHelper.filterByGenderAndType(gender: "Female", kind: "Cat", data: items))
        tableView.reloadData()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Male"
        }
        else if section == 1 {
            return "Female"
        }
        return ""
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return self.petListMale.count
        }
        else if section == 1 {
            return self.petListFemale.count
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: storyboard.cellReuseIdentifier, for: indexPath)

        if indexPath.section == 0 {
            cell.textLabel?.text = self.petListMale[indexPath.row].name
        }
        else if indexPath.section == 1 {
            cell.textLabel?.text = self.petListFemale[indexPath.row].name
        }
        else {
            cell.textLabel?.text = ""
        }
        return cell
    }
}
