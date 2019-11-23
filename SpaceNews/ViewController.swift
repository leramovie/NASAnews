//
//  ListOfNASAViewController.swift
//  SpaceL
//
//  Created by Lera on 14.11.2019.
//  Copyright © 2019 Parakluence. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var titleItem = [String?]()
    
    @IBAction func run(_ sender: UIButton) {
        downloadJSON()
    }
    @IBAction func cancelAction(_ segue: UIStoryboardSegue) {}

    
    func downloadJSON() {

        guard let url = URL(string: "https://images-api.nasa.gov/search?q=earth") else { return }
                  let request = NSMutableURLRequest(url: url)

                  let session = URLSession.shared
                  session.dataTask(with: request as URLRequest) { (data, response, error) in


                      if let response = response {
                          print (response)
                      }

                      guard let data = data else {return}

                      do{

                          let myJson = try JSONDecoder().decode(Object.self, from: data)
                        for i in 0...50{
                            self.titleItem = [myJson.collection?.items[i]?.data[0]?.title]
                        }
                        print(myJson)
 
                        for i in 0...50{
                    
                            print ("Title: \(myJson.collection?.items[i]?.data[0]?.title)")
                        }

              } catch {
                  print(error)
              }
          }.resume()

      }
    
}
    
//    if let items = myJson["items"] as? [String: AnyObject] {
//
//                      if let data = items["data"] as? [String: AnyObject]{
//
//
//                          if let titleItem = data["title"] as? String {
//                              self.condition = titleItem
//                              print(titleItem)
//                          }
//                      }
//                  }
//
    
    


