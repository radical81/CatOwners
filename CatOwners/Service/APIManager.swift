//
//  APIManager.swift
//  CatOwners
//
//  Created by Rex Jason Alobba on 3/3/18.
//  Copyright © 2018 Rex Jason Alobba. All rights reserved.
//

import Foundation

class APIManager {
    func loadData(_ urlString: String, completion: @escaping ([Owner]) -> Void) {
        let config = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: config)
        guard let url = URL(string: urlString) else {
            print("Error: cannot create URL")
            return
        }
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) -> Void in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard data != nil else {
                print("Error: No data in response")
                return
            }
            
            //Convert to UTF-8
            guard let responseData = data else {
                return
            }
            
            //Added for JSONSerialization
            do {
                /* .AllowFragments - top level object is not Array or Dictionary.
                 Any type of string or value
                 NSJSONSerialization requires the Do / Try / Catch
                 Converts the NSDATA into a JSON Object and cast it to a Dictionary */
                
                if let json = try JSONSerialization.jsonObject(with: responseData, options: .allowFragments) as? [[String: Any]]
                {
                    var ownerArray = [Owner]()
                    for (_, row) in json.enumerated() {
                        guard let owner = Owner(json: row) else {
                            continue
                        }
                        ownerArray.append(owner)
                    }
                    
                    DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
                        DispatchQueue.main.async {
                            completion(ownerArray)
                        }
                    }
                }
            } catch {
                print("error in NSJSONSerialization \(error)")
            }
            //End of JSONSerialization
        })
        task.resume()
    }
}
