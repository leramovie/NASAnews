//
//  ListOfNASAViewController.swift
//  SpaceL
//
//  Created by Igor Mikhalev on 14.11.2019.
//  Copyright © 2019 Parakluence. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
        
    @IBAction func run(_ sender: UIButton) {
   
        guard let url = URL(string: "https://images-api.nasa.gov/search?keywords=NASA/") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print (response)
            }
            
            guard let data = data else {return}
            do {
                let someItems = try JSONDecoder().decode(Items.self, from: data)
                print(someItems)
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print(json)
            } catch {
                print(error)
            }
        }.resume()
    }
  
    
    
}
