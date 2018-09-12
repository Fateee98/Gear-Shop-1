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
    
    @IBOutlet weak var mLabel: UILabel!
    
    @IBOutlet weak var mLabel2: UILabel!
    
    @IBOutlet weak var mLabel3: UILabel!
    
    @IBOutlet weak var mLabel4: UILabel!
    
    @IBOutlet weak var mLabel5: UILabel!
    
    @IBOutlet weak var mLabel6: UILabel!
    
    @IBOutlet weak var mDetailLabel: UILabel!
    
    @IBOutlet weak var mDetailLabel2: UILabel!
    
    @IBOutlet weak var mDetailLabel3: UILabel!
    
    @IBOutlet weak var mDetailLabel4: UILabel!
    
    @IBOutlet weak var mDetailLabel5: UILabel!
    
    @IBOutlet weak var mDetailLabel6: UILabel!
    
    
    
    var mScreenType = screenType.cpu
    var mCpuProduct : CPUModel?
    var mVGaProduct : VGAModel?
    var mRamProduct : RamModel?
    var mMainProduct : MoboModel?
    var mAllProduct : BaseModeVO?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if mCpuProduct != nil {
            let request = ImageRequest(urlRequest: URLRequest(url: URL(string: (mCpuProduct?.url_image)!)!))
            Nuke.loadImage(with: request, into: mImgDetailProduct)
            mProductPrice.text = mCpuProduct?.price
            mNameProduct.text = mCpuProduct?.name
            mLabel.text = "Bus ram support: "
            mDetailLabel.text = mCpuProduct?.bus_ram_support
            mLabel2.text = "Core: "
            mDetailLabel2.text = mCpuProduct?.core
            mLabel3.text = "Detail: "
            mDetailLabel3.text = mCpuProduct?.detail
            mLabel4.text = "Socket: "
            mDetailLabel4.text = mCpuProduct?.socket
            print(mCpuProduct?.socket)
            mLabel5.text = "Speed: "
            mDetailLabel5.text = mCpuProduct?.speed
            mLabel6.text = "Thread: "
            mDetailLabel6.text = mCpuProduct?.thread
        }

        if mVGaProduct != nil {
            let request = ImageRequest(urlRequest: URLRequest(url: URL(string: (mVGaProduct?.url_image)!)!))
            Nuke.loadImage(with: request, into: mImgDetailProduct)
            mProductPrice.text = mVGaProduct?.price
            mNameProduct.text = mVGaProduct?.name
            mLabel.text = "Bus standard: "
            mDetailLabel.text = mVGaProduct?.bus_standard
            mLabel2.text = "Recommended PSU: "
            mDetailLabel2.text = mVGaProduct?.recommended_PSU
            mLabel3.text = "Resolution: "
            mDetailLabel3.text = mVGaProduct?.resolution
            mLabel4.text = "Video memory: "
            mDetailLabel4.text = mVGaProduct?.video_memory
            mLabel5.isHidden = true
            mDetailLabel5.isHidden = true
            mLabel6.isHidden = true
            mDetailLabel6.isHidden = true
        }
        
        if mRamProduct != nil {
            let request = ImageRequest(urlRequest: URLRequest(url: URL(string: (mRamProduct?.url_image)!)!))
            Nuke.loadImage(with: request, into: mImgDetailProduct)
            mProductPrice.text = mRamProduct?.price
            mNameProduct.text = mRamProduct?.name
            mLabel.text = "Bus: "
            mDetailLabel.text = mRamProduct?.bus
            mLabel2.text = "Memory: "
            mDetailLabel2.text = mRamProduct?.memory
            mLabel3.text = "Type: "
            mDetailLabel3.text = mRamProduct?.type
            mLabel4.isHidden = true
            mDetailLabel4.isHidden = true
            mLabel5.isHidden = true
            mDetailLabel5.isHidden = true
            mLabel6.isHidden = true
            mDetailLabel6.isHidden = true
        }
        
        if mMainProduct != nil {
            let request = ImageRequest(urlRequest: URLRequest(url: URL(string: (mMainProduct?.url_image)!)!))
            Nuke.loadImage(with: request, into: mImgDetailProduct)
            mProductPrice.text = mMainProduct?.price
            mNameProduct.text = mMainProduct?.name
            mLabel.text = "Chipset/socket: "
            mDetailLabel.text = mMainProduct?.chipset_socket
            mLabel2.text = "CPU support: "
            mDetailLabel2.text = mMainProduct?.cpu_support
            mLabel3.text = "Lan/Wireless: "
            mDetailLabel3.text = mMainProduct?.lan_wireless
            mLabel4.isHidden = true
            mDetailLabel4.isHidden = true
            mLabel5.isHidden = true
            mDetailLabel5.isHidden = true
            mLabel6.isHidden = true
            mDetailLabel6.isHidden = true
        }
        if mAllProduct != nil
        {
            let request = ImageRequest(urlRequest: URLRequest(url: URL(string: (mAllProduct?.url_image)!)!))
            Nuke.loadImage(with: request, into: mImgDetailProduct)
            mProductPrice.text = mAllProduct?.price
            mNameProduct.text = mAllProduct?.name
            
            switch mScreenType {
            case screenType.cpu:
                return mLabel.text = "1"
            case screenType.vga:
                return mLabel.text = "2"
            case screenType.ram:
                return mLabel.text = "3"
            case screenType.mobo:
                return mLabel.text = "4"
                
            default:
                return
            }
        }
        removeBorderNavigation()
    }

    func removeBorderNavigation()
    {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
}
