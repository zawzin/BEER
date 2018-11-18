//
//  HopVO.swift
//  BEER
//
//  Created by Zaw Zin Phyo on 11/17/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation
import SwiftyJSON

class HopVO {
    
    var name : String? = nil
    
    var amount : AmountVO? = nil
    
    static func parseToHopVO(_ data: JSON) -> HopVO {
        
        let hop = HopVO()
        
        hop.name = data["name"].string
//        hop.amount = data["amount"].object as? AmountVO
        hop.amount = AmountVO.parseToAmountVO(data["amount"])
        
        return hop
        
    }
    
}
