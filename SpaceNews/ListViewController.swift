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
  
   // let json = JSON(jsonObject)

//    var myJSON = [Items]()
//    var nasaCollection = [Collection]()
   
    //let titleLabel1 = ["First", "Second", "third"]
    var itemsArr = [NasaData]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON()
    }
 

      func downloadJSON() {

        let url = URL(string: "https://images-api.nasa.gov/search?q=earth")
        guard let downloadURL = url else {return}
        
            let session = URLSession.shared
            session.dataTask(with: downloadURL) { data, response, error in
                          guard let data = data else {return}
                          do{
                            //self.myJSON = [try JSONDecoder().decode(Items.self, from: data)]
                              let myJSON = try JSON(data: data)
                            let items = myJSON["collection"]["items"]
                            
                              for item in items.arrayValue {
                                var title = item["data"][0]["title"].stringValue
                                self.itemsArr.append(NasaData(nasa_id: "", title: title, date_created: "", media_type: ""))
                              }
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                            
                              print(self.itemsArr)
                            }catch{
                                print(error)
                            }
                        }.resume()
                                       
                            //return nasaItems
                            //for i in 0...50{
                            //}
                    //for i in 0...50{}
                            //self.titleItem = [myJson.collection?.items[1]?.data[0]?.title]
                            //print ("Title: \(myJSON.collection?.items[i]?.data[0]?.title)")
                         
          }

//    struct NasaData: Codable {
//        var center: String?
//        var nasa_id: String?
//        var title: String?
//        var date_created: String?
//        //var keywords: [String]?
//        var media_type: String?
//
//            init(center: String, nasa_id: String, title: String, date_created: String, media_type: String) {
//                self.center = center
//                self.nasa_id = nasa_id
//                self.title = title
//                self.date_created = date_created
//                self.media_type = media_type
//            }
//
//    }
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return itemsArr.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NASACell") as! NASAdataCell
            cell.titleLabel?.text = itemsArr[indexPath.row].title
            //"Title: " + data[indexPath.row].title
            return cell
        }


}


