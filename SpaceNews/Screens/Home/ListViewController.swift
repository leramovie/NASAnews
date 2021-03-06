//
//  ListViewController.swift
//  SpaceNews
//
//  Created by Parakluence on 14.11.2019.
//  Copyright © 2019 Parakluence. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage


final class ListViewController: UITableViewController {

    var itemsArr = [NasaData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON()
    }
 
    private func downloadJSON() {

        let date = Date()
        let calendar = Calendar.current
        let weekday = calendar.component(.year, from: date)

        let url = URL(string: "https://images-api.nasa.gov/search?q=space&media_type=image&year_start=2019&year_end=\(weekday)")
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
                        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"
                        let date = dateFormatter.date(from: date_created)
                                                          
                        let uiDateFormatter = DateFormatter()
                        uiDateFormatter.dateFormat = "dd MMM, yyyy"
                        let uiDate = uiDateFormatter.string(from: date!)
                                                    
                        self.itemsArr.append(NasaData(nasa_id: nasa_id, title: title, date_created: uiDate, media_type: "", href: href, description: description, date_created_sort: date!))
            }
                                                      
            self.itemsArr.sort(by: { $0.date_created_sort! > $1.date_created_sort! } )


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
            return cell
        }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let selectedRow = indexPath.row
                let dvc = segue.destination as! DetailViewController
                    dvc.titleText = self.itemsArr[selectedRow].title
                    dvc.imageURL = self.itemsArr[indexPath.row].href
                    dvc.abstract = self.itemsArr[indexPath.row].description
            }
        }

}



   
