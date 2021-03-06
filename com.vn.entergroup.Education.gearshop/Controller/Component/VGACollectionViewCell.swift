//
//  VGACollectionViewCell.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/4/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit
import Nuke
class VGACollectionViewCell: UICollectionViewCell {

    var cutStringmoney = API()
    
    @IBOutlet weak var mImgVGA: UIImageView!
    
    @IBOutlet weak var mLabelVGA: UILabel!
    
    @IBOutlet weak var mPriceVGA: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setdataVGA(data: VGAModel) {
        let price = cutStringmoney.formatMoney(money: String(data.price))
        mLabelVGA.text = data.name
        mPriceVGA.text = price
        mImgVGA.image = UIImage(named: data.url_image)
        let request = ImageRequest(urlRequest: URLRequest(url: URL(string: data.url_image)!))
        Nuke.loadImage(with: request, into: mImgVGA)
    }

}
