//
//  NASAitem.swift
//  SpaceNews
//
//  Created by Igor Mikhalev on 22.11.2019.
//  Copyright © 2019 Parakluence. All rights reserved.
//

import UIKit


    struct Object: Codable{
        var collection: Collection?
        var intValue: Int?
            init(collection: Collection, intValue: Int){
                self.collection = collection
                self.intValue = intValue
            }
    }
        
        struct Collection: Codable{
            var metadata: Metadata?
            var version: String?
            var items: [Items?]
            var links: [LinksCollection?]
            var href: String?
                init(metadata: Metadata, version: String, items: [Items], links: [LinksCollection], href: String){
                    self.metadata = metadata
                    self.version = version
                    self.items = items
                    self.links = links
                    self.href = href
                }
        }
            struct Metadata: Codable{
                var total_hits: Int?    //Количество элементов по запросу, можно сделать количество строк в таблице
                    init(total_hits: Int){
                        self.total_hits = total_hits
                    }
            }
            struct Items: Codable{
                
                var data: [NasaData?]
                var links: [LinksItems?]
                var href: String?
                init(data: [NasaData], links: [LinksItems], href: String){
                    self.data = data
                    self.links = links
                    self.href = href
                }
            }
                struct NasaData: Codable {
                    var description_508: String?
                    var center: String?
                    var nasa_id: String?
                    var title: String?
                    var date_created: String?
                    //var keywords: [String]?
                    var media_type: String?
                    
                        init(description_508: String, center: String, nasa_id: String, title: String, date_created: String, media_type: String) {
                            self.description_508 = description_508
                            self.center = center
                            self.nasa_id = nasa_id
                            self.title = title
                            self.date_created = date_created
                            self.media_type = media_type
                        }
                    
                }
                struct LinksItems: Codable{
                    //var render: String?
                    var rel: String?
                    var href: String?
                        init(rel: String, href:String) {
                            self.rel = rel
                            self.href = href
                        }
                }
            
            struct LinksCollection: Codable{
                var prompt: String?
                var rel: String?
                var href: String?
                init(prompt: String, rel: String, href: String) {
                    self.prompt = prompt
                    self.rel = rel
                    self.href = href
                }
            }
        
    



