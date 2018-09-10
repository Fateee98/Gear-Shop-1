//
//  DetailProductViewController.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/6/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit

class DetailProductViewController: UIViewController {

    @IBOutlet weak var mImgDetailProduct: UIImageView!
    
    @IBOutlet weak var mNameProduct: UILabel!
    
    @IBOutlet weak var mProductPrice: UILabel!
    
    var imagess = UIImage()
    var price = ""
    var nameprod = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mNameProduct.text = nameprod
        mImgDetailProduct.image = imagess
        mProductPrice.text = price

        // Do any additional setup after loading the view.
    }

}
