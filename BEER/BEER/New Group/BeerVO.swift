//
//  BeerVO.swift
//  BEER
//
//  Created by Zaw Zin Phyo on 11/17/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation
import SwiftyJSON

class BeerVO {
    
    var id : Int? = 0
    
    var name : String? = nil
    
    var tagline : String? = nil
    
    var firstBrewed : String? = nil

    var description : String? = nil
    
    var imageUrl : String? = nil
    
    var ingredient: IngredientVO? = nil
    
    var foodPairing: [String]? = nil
    
    var brewersTip: String? = nil
    
    var contributedBy: String? = nil
    
    static func parseToBeerVO(_ data: JSON) -> BeerVO {
        let beer = BeerVO()
        
        beer.id = data["id"].int
        beer.name = data["name"].string
        beer.tagline = data["tagline"].string
        beer.firstBrewed = data["first_brewed"].string
        beer.description = data["description"].string
        beer.imageUrl = data["image_url"].string
        beer.ingredient = IngredientVO.parseToIngredientVO(data["ingredients"])
        beer.foodPairing = data["food_pairing"].arrayObject as? [String]
        beer.brewersTip = data["brewers_tips"].string
        beer.contributedBy = data["contributed_by"].string
        
        return beer
        
    }
}
