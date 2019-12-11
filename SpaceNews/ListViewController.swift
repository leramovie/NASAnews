//
//  ListViewController.swift
//  SpaceNews
//
//  Created by Igor Mikhalev on 14.11.2019.
//  Copyright © 2019 Parakluence. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage


class ListViewController: UITableViewController {

    var itemsArr = [NasaData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON()
    }
 

      func downloadJSON() {

        let url = URL(string: "https://images-api.nasa.gov/search?q=space&media_type=image&year_start=2019&year_end=2019")
        guard let downloadURL = url else {return}
        
            let session = URLSession.shared
            session.dataTask(with: downloadURL) { data, response, error in
                          guard let data = data else {return}
                          do{
                              let myJSON = try JSON(data: data)
                            let items = myJSON["collection"]["items"]
                            
                              for item in items.arrayValue {
                                var title = item["data"][0]["title"].stringValue
                                var date_created = item["data"][0]["date_created"].stringValue
                                var nasa_id = item["data"][0]["nasa_id"].stringValue
                                
                                var href = item["links"][0]["href"].stringValue
                                self.itemsArr.append(NasaData(nasa_id: nasa_id, title: title, date_created: date_created, media_type: "", href: href))
                              }
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                            
                              print(self.itemsArr)
                            }catch{
                                print(error)
                            }
                        }.resume()                         
          }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return itemsArr.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NASACell") as! NASAdataCell
            let imageCellFrame = cell.imageCell?.frame

            cell.titleLabel?.text = itemsArr[indexPath.row].title
            cell.date_createdLabel?.text = itemsArr[indexPath.row].date_created
            cell.imageCell?.sd_setImage(with: URL(string: itemsArr[indexPath.row].href!), placeholderImage: UIImage(named: itemsArr[indexPath.row].href!)
            )

            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
                return 85
            }
            
            return cell
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        if segue.identifier == "detailSegue" {
//            print("Ага определил сигвей по id")
            if let indexPath = self.tableView.indexPathForSelectedRow{
                print("Тут")
                let selectedRow = indexPath.row
               let dvc = segue.destination as! DetailViewController
                dvc.titleText = self.itemsArr[selectedRow].title
            }
             
        
    }

}



   
