//
//  BeerCollectionViewCell.swift
//  BEER
//
//  Created by Zaw Zin Phyo on 11/17/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class BeerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ivBeer: UIImageView!
    
    @IBOutlet weak var tvBeer: UILabel!
    
    @IBOutlet weak var tvContributedBy: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
