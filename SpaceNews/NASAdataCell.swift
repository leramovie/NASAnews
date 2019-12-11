//
//  NASAdata.swift
//  SpaceNews
//
//  Created by Lera on 22.11.2019.
//  Copyright © 2019 Parakluence. All rights reserved.
//


import UIKit

class NASAdataCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var date_createdLabel: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    
//    func clickCell(cell: UITableViewCell) {
//
//    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
    
    override func prepareForReuse(for segue: UIStoryboardSegue, sender: Any?){
        guard let dvc = segue.destination as? DetailViewController else {return}
        dvc.titleText = titleLabel.text
    }
    
    override func prepareForReuse() {
        <#code#>
    }

}
