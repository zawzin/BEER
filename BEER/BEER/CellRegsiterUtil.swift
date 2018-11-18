//
//  CellRegsiterUtil.swift
//  BEER
//
//  Created by Zaw Zin Phyo on 11/17/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation
import UIKit

class CellRegsiterUtil{
    static func collectionCellRegister(nibName : String, collectionView : UICollectionView) {
        let nib = UINib(nibName: nibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: nibName)
    }
    
    static func tableCellRegister(nibName : String, tableView : UITableView) {
        let nib = UINib(nibName: nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: nibName)
    }
}
