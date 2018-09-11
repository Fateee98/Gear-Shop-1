//
//  DetailProductViewController.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/6/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit
import Nuke
class DetailProductViewController: UIViewController {

    @IBOutlet weak var mImgDetailProduct: UIImageView!
    
    @IBOutlet weak var mNameProduct: UILabel!
    
    @IBOutlet weak var mProductPrice: UILabel!
    
    var mCpuProduct : CPUModel?
    var mVGaProduct : VGAModel?
    var mRamProduct : RamModel?
    var mMainProduct : MoboModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if mCpuProduct != nil {
            let request = ImageRequest(urlRequest: URLRequest(url: URL(string: (mCpuProduct?.url_image)!)!))
            Nuke.loadImage(with: request, into: mImgDetailProduct)
            mProductPrice.text = mCpuProduct?.price
            mNameProduct.text = mCpuProduct?.name
        }

        if mVGaProduct != nil {
            let request = ImageRequest(urlRequest: URLRequest(url: URL(string: (mVGaProduct?.url_image)!)!))
            Nuke.loadImage(with: request, into: mImgDetailProduct)
            mProductPrice.text = mVGaProduct?.price
            mNameProduct.text = mVGaProduct?.name
        }
        
        if mRamProduct != nil {
            let request = ImageRequest(urlRequest: URLRequest(url: URL(string: (mRamProduct?.url_image)!)!))
            Nuke.loadImage(with: request, into: mImgDetailProduct)
            mProductPrice.text = mRamProduct?.price
            mNameProduct.text = mRamProduct?.name
        }
        
        if mMainProduct != nil {
            let request = ImageRequest(urlRequest: URLRequest(url: URL(string: (mMainProduct?.url_image)!)!))
            Nuke.loadImage(with: request, into: mImgDetailProduct)
            mProductPrice.text = mMainProduct?.price
            mNameProduct.text = mMainProduct?.name
        }
    }

}
