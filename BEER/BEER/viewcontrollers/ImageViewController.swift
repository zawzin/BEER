//
//  ImageViewController.swift
//  BEER
//
//  Created by Zaw Zin Phyo on 11/18/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit
import SDWebImage

class ImageViewController: UIViewController {

    @IBOutlet weak var sVImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var btnBack: UIImageView!
    
    var image : String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.maximumZoomScale = 10
        scrollView.minimumZoomScale = 1

        sVImage.sd_setImage(with: URL(string: image!), completed: nil)
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(self.tapDetected))
        btnBack.isUserInteractionEnabled = true
        btnBack.addGestureRecognizer(singleTap)
        
    }
    
    @objc func tapDetected() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension ImageViewController : UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.sVImage
    }
}
