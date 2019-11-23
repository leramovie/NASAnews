//
//  ListViewController.swift
//  SpaceNews
//
//  Created by Igor Mikhalev on 14.11.2019.
//  Copyright © 2019 Parakluence. All rights reserved.
//

import UIKit
import SwiftyJSON



class ListViewController: UITableViewController {
  
    let json = JSON(jsonObject)

    var myJSON = [Items]()
    var nasaCollection = [Collection]()
   
    //let titleLabel1 = ["First", "Second", "third"]
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON()
    }
 

      func downloadJSON() {

        let url = URL(string: "https://images-api.nasa.gov/search?q=earth")
        guard let downloadURL = url else {return}
        
            let session = URLSession.shared
            session.dataTask(with: downloadURL) { data, response, error in
                          guard let data = data, error == nil, response != nil else {
                            print("something wrong")
                            return
                          }
                          print("downloaded")
                          do{
                            self.myJSON = [try JSONDecoder().decode(Items.self, from: data)]

                                
                            
                            //return nasaItems
                            //for i in 0...50{
                            //}
                    //for i in 0...50{}
                            //self.titleItem = [myJson.collection?.items[1]?.data[0]?.title]
                            //print ("Title: \(myJSON.collection?.items[i]?.data[0]?.title)")
                          } catch {
                      print(error)
                  }
              }.resume()
            
          }


        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return myJSON.count
        }

//        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NASACell") as? NASAdatCell else {return UITableViewCell}//, for: indexPath)
//
//            cell.titleLabel?.text = myJSON[indexPath.row].title
//            //"Title: " + data[indexPath.row].title
//            return cell
//        }


}


