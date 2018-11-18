//
//  AmountVO.swift
//  BEER
//
//  Created by Zaw Zin Phyo on 11/17/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation
import SwiftyJSON

class AmountVO {
    
    var value : Double? = 0.0
    
    var unit : String? = nil
    
    static func parseToAmountVO(_ data: JSON) -> AmountVO {
        let amount = AmountVO()
        
        amount.value = data["value"].double
        amount.unit = data["unit"].string
        
        return amount
    }
}
