//
//  ViewController.swift
//  BEER
//
//  Created by Zaw Zin Phyo on 11/17/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var cvBeer: UICollectionView!
    
    
    var beerList : [BeerVO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cvBeer.dataSource = self
        self.cvBeer.delegate = self
        
        CellRegsiterUtil.collectionCellRegister(nibName: "BeerCollectionViewCell", collectionView: self.cvBeer)
        
        loadBeer()
    }

    func loadBeer() {
        
        Alamofire.request("https://api.punkapi.com/v2/beers", method: .get).responseJSON { (response) in
            
            switch response.result {
                
            case .success:
                
                let api = response.result.value
                
                let json = JSON(api!)
                
                let data = json[].array
                
                if let result = data {
                    
                    var beers : [BeerVO] = []
                    
                    result.forEach({ (beer) in
                        beers.append(BeerVO.parseToBeerVO(beer))
                    })
                    
                    self.beerList = beers
                    self.cvBeer.reloadData()
                }
                
                break
                
            case .failure:
                print("fail call")
                break
                
            }
            
        }
        
    }
    
    func onTapDetail(beer: BeerVO) {
        let nvDetail = self.storyboard?.instantiateViewController(withIdentifier: "BeerDetailViewController") as! UINavigationController
        let vcDetail = nvDetail.viewControllers[0] as! BeerDetailViewController
        vcDetail.beer = beer
        self.present(nvDetail, animated: true, completion: nil)
    }

}

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeerCollectionViewCell", for: indexPath) as! BeerCollectionViewCell
        
        cell.tvBeer.text = beerList[indexPath.row].name
        cell.tvContributedBy.text = beerList[indexPath.row].tagline
        cell.ivBeer.sd_setImage(with: URL(string: beerList[indexPath.row].imageUrl!), completed: nil)
        return cell
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize.init(width: width, height: width * 0.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onTapDetail(beer: beerList[indexPath.row])
    }
}
