//
//  IngredientVO.swift
//  BEER
//
//  Created by Zaw Zin Phyo on 11/17/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation
import SwiftyJSON

class IngredientVO {
    
    var maltList : [MaltVO]? = nil
    
    var hopList : [HopVO]? = nil
    
    var yeast : String? = nil
    
    static func parseToIngredientVO(_ data: JSON) -> IngredientVO {
        let ingredient = IngredientVO()
        
//        ingredient.malt = data["malt"].arrayObject as? [MaltVO]
//        ingredient.hop = data["hops"].arrayObject as? [HopVO]
        
        if let resultMalts = data["malt"].array {
            
            var malts : [MaltVO] = []
            
            resultMalts.forEach({ (malt) in
                malts.append(MaltVO.parseToMaltVO(malt))
            })
            ingredient.maltList = malts
        }
        
        if let resultHop = data["hops"].array {
            var hops : [HopVO] = []
            
            resultHop.forEach({(hop) in
                hops.append(HopVO.parseToHopVO(hop))
            })
            
            ingredient.hopList = hops
        }
        
        ingredient.yeast = data["yeast"].string
        
        return ingredient
    }
}
