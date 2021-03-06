//
//  RamCollectionViewCell.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/6/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit
import Nuke
class RamCollectionViewCell: UICollectionViewCell {

    var cutStringmoney = API()
    @IBOutlet weak var mImgRam: UIImageView!
    
    @IBOutlet weak var mLabelRam: UILabel!
    
    @IBOutlet weak var mPriceRam: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setdataRam(data: RamModel) {
        let price = cutStringmoney.formatMoney(money: String(data.price))
        mLabelRam.text = data.name
        mPriceRam.text = price
        mImgRam.image = UIImage(named: data.url_image)
        let request = ImageRequest(urlRequest: URLRequest(url: URL(string: data.url_image)!))
        Nuke.loadImage(with: request, into: mImgRam)
    }
}
