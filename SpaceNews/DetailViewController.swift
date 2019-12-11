//
//  ListOfNASAViewController.swift
//  SpaceL
//
//  Created by Lera on 14.11.2019.
//  Copyright © 2019 Parakluence. All rights reserved.
//
import SwiftyJSON
import UIKit

class DetailViewController: UIViewController {

    var titleText: String!
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
//    func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        if segue.identifier == "detailSeque" {
//            if let indexPath =
//
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        guard let titleLabel = titleLabel else {return}
        titleLabel.text = titleText
        
    }
    
}
