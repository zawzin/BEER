//
//  BeerDetailTableViewController.swift
//  BEER
//
//  Created by Zaw Zin Phyo on 11/17/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit
import SDWebImage

class BeerDetailViewController: UIViewController {

    @IBOutlet weak var ivBeer: UIImageView!
    @IBOutlet weak var tvBeerName: UILabel!
    @IBOutlet weak var tvTagLine: UILabel!
    @IBOutlet weak var tvFirstBrewed: UILabel!
    @IBOutlet weak var tvBeerDescription: UILabel!
    @IBOutlet weak var tvMalts: UILabel!
    @IBOutlet weak var tvHops: UILabel!
    @IBOutlet weak var tvYeast: UILabel!
    @IBOutlet weak var tvFoodPairing: UILabel!
    @IBOutlet weak var tvBrewersTips: UILabel!
    @IBOutlet weak var tvContribute: UILabel!
    
    var beer : BeerVO = BeerVO()
    var malts: String = ""
    var hops : String = ""
    var fpCount : Int = 0
    var fp : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ivBeer.sd_setImage(with: URL(string: beer.imageUrl!), completed: nil)
        tvBeerName.text = beer.name
        tvTagLine.text = beer.tagline
        tvFirstBrewed.text = beer.firstBrewed
        tvBeerDescription.text = beer.description
        
        tvBrewersTips.text = beer.brewersTip
        tvContribute.text = "Contributed by \(String(describing: beer.contributedBy))"
        
        beer.ingredient?.maltList?.forEach({ (malt) in
                malts += "- \(malt.name!) ( \(malt.amount!.value!) \(malt.amount!.unit!) )\n"
        })
        tvMalts.text = malts
        
        beer.ingredient?.hopList?.forEach({ (hop) in
            hops += "- \(hop.name!) ( \(hop.amount!.value!) \(hop.amount!.unit!) )\n"
        })
        tvHops.text = hops
        
        beer.foodPairing?.forEach({ (food) in
            fpCount += 1
            fp += "\(fpCount). \(food)\n"
        })
        tvFoodPairing.text = fp
        
        let singleTap = UITapGestureRecognizer(target: self, action: (#selector(self.tapDetected)))
        ivBeer.isUserInteractionEnabled = true
        ivBeer.addGestureRecognizer(singleTap)
    
    }
    @objc func tapDetected() {
        let imageVC = self.storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
        imageVC.image = beer.imageUrl
        self.present(imageVC, animated: true, completion: nil)
    }

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
