//
//  ListOfNASAViewController.swift
//  SpaceL
//
//  Created by Lera on 14.11.2019.
//  Copyright © 2019 Parakluence. All rights reserved.
//
import SwiftyJSON
import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    var titleText: String!
    var imageURL: String!
    var abstract: String!
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    //@IBOutlet weak var abstractLabel: UILabel!
    
    @IBOutlet weak var descriptionTextVIew: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        guard let titleLabel = titleLabel else {return}
        titleLabel.text = titleText
        
        guard let descriptionTextVIew = descriptionTextVIew else {return}
        descriptionTextVIew.text = abstract
        
        self.imageCell.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "placeholder.png"), options: SDWebImageOptions(), completed: { (image, error, cacheType, imageURL) -> Void in
            print("loaded")
        })
        
        
    }
    
}
