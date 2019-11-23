//
//  NASAApiCLient.swift
//  SpaceNews
//
//  Created by Igor Mikhalev on 19.11.2019.
//  Copyright © 2019 Parakluence. All rights reserved.
//

import Foundation

class NASAApiClient {
    
//    typealias JSON = [String: String]
//    
//    static func getDataFromAPI(with completion: @escaping (JSON) ->()) {
//    
//        let urlString = "https://images-api.nasa.gov/search?q=satellite/"
//        let url = URL(string: urlString)
//        guard let unwrappedURL = url else {return}
//        
//        let session = URLSession.shared
//        let task = session.dataTask(with: unwrappedURL) { (data, response, error) in
//                
//                print("Start")
//                guard let unwrappedData = data else {return}
//                
//                do{
//                    let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! JSON
//                    completion(responseJSON)
//                    print("got data")
//
//                } catch {
//                    print(error)
//                }
//            }
//            task.resume()
//    }
    }
