////
////  NASAitem.swift
////  SpaceNews
////
////  Created by Igor Mikhalev on 22.11.2019.
////  Copyright © 2019 Parakluence. All rights reserved.
////
//
import UIKit


                struct NasaData {
                    //var center: String?
                    var nasa_id: String?
                    var title: String
                    var date_created: String?
                    //var keywords: [String]?
                    var media_type: String?
                    var href: String?
                    var description: String?
                    var date_created_sort: Date?
                    
                    init(nasa_id: String, title: String, date_created: String, media_type: String, href: String, description: String, date_created_sort: Date) {
                            //self.center = center
                            self.href = href
                            self.nasa_id = nasa_id
                            self.title = title
                            self.date_created = date_created
                            self.media_type = media_type
                            self.description = description
                            self.date_created_sort = date_created_sort
                        }
                    
                }
    
               
                




