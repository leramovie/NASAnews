//
//  ListOfNASAViewController.swift
//  SpaceL
//
//  Created by Igor Mikhalev on 14.11.2019.
//  Copyright © 2019 Parakluence. All rights reserved.
//

import UIKit

struct Collection: Decodable{
    var items: Items?
}

struct Items: Decodable{
    
    var data: [Data?]
    var links: [LinksMain?]
    var href:[HrefMain?]
}

struct Data: Decodable {
    var description_508: String?
    var photographer: String?
    var center: String?
    var nasa_id: String?
    var description: String?
    var title: String?
    var date_created: String?
    var keywords: [String]?
    var location: String?
    var media_type: String?
    
}

struct HrefMain: Decodable {
    var hrefMain: String?
}

struct LinksMain: Decodable{
    var href: String?
    var rel: String?
    var render: String?
}


    


class ViewController: UIViewController {


    @IBAction func run(_ sender: UIButton) {
   
        guard let url = URL(string: "https://images-api.nasa.gov/search?q=satellite/") else { return }

        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print (response)
            }

            guard let data = data else {return}
            
            //Расскоментируй либо этот блок Do либо следующий, вместе они не работают
            //Этот блок do для того чтобы парсить инфу в структуры
            do {
               let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)

            } catch {
                print(error)
            }
            //Этот блок do для того чтобы вывести json в дебаггер
//            do{
//                let someItems = try JSONDecoder().decode(Collection.self, from: data)
//                print(someItems)
//            } catch {
//                print(error)
//            }
        }.resume()
    }
  
  @IBAction func cancelAction(_ segue: UIStoryboardSegue) {}

    
}

