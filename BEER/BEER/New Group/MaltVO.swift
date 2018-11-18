//
//  maltVO.swift
//  BEER
//
//  Created by Zaw Zin Phyo on 11/17/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation
import SwiftyJSON

class MaltVO {
    
    var name : String? = nil
    
    var amount : AmountVO? = nil
    
    static func parseToMaltVO(_ data : JSON) -> MaltVO {
        
        let malt = MaltVO()
        
        malt.name = data["name"].string
//        malt.amount = data["amount"].object as? AmountVO
        malt.amount = AmountVO.parseToAmountVO(data["amount"])
        
        return malt
    }
    
}
