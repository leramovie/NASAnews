//
//  Model.swift
//  SpaceNews
//
//  Created by Igor Mikhalev on 15.11.2019.
//  Copyright © 2019 Parakluence. All rights reserved.
//

import Foundation

struct Items: Decodable{
    var data:[Data?]
    var href:[HrefMain?]
    var links: [LinksMain?]
}

struct Data: Decodable {
    var center: String
    var date_created: String
    var description_508: String
    var keywords: String
    var media_type: String
    var nasa_id: String
    var title: String
    
}

struct HrefMain: Decodable {
    var hrefMain: String
}

struct LinksMain: Decodable{
    var href: String
    var rel: String
    var render: String
}
