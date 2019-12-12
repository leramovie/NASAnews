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
    
    //var dateFormatter = DateFormatter()
    //dateFormatter.dateFormat = "dd MM, yyyy"
    
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
                                let title = item["data"][0]["title"].stringValue
                                let nasa_id = item["data"][0]["nasa_id"].stringValue
                                let description = item["data"][0]["description"].stringValue
                                let href = item["links"][0]["href"].stringValue
                                let date_created = item["data"][0]["date_created"].stringValue

                                let dateFormatter = DateFormatter()
                                let date = Date(timeIntervalSinceReferenceDate: 410220000)

                                //dateFormatter.locale = Locale(identifier: "en_US")
                                //dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                                dateFormatter.dateFormat = "MMM dd"
                                var someDateTime = dateFormatter.string(from: date)

                                //date_created = dateFormatter.date(from: date_created)
                               
                           
                              
                               
                                self.itemsArr.append(NasaData(nasa_id: nasa_id, title: title, date_created: someDateTime, media_type: "", href: href, description: description))
                              }
                            
//                            var sortedItems = self.itemsArr.sorted(by: { UIContentSizeCategory(rawValue: $0.date_created!) > UIContentSizeCategory(rawValue: $1.date_created!) })
//
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
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let selectedRow = indexPath.row
                let dvc = segue.destination as! DetailViewController
                    dvc.titleText = self.itemsArr[selectedRow].title
                    dvc.imageURL = self.itemsArr[indexPath.row].href
                    dvc.abstract = self.itemsArr[indexPath.row].description
               // print(itemsArr[indexPath.row].description)
                
            }
    }

}



   
