//
//  CPUCollectionViewCell.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/4/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit
import Nuke

class CPUCollectionViewCell: UICollectionViewCell {
    
    var cutStringmoney = API()
    
    @IBOutlet weak var mLabelCPU: UILabel!
    @IBOutlet weak var mLabelPrice: UILabel!
    @IBOutlet weak var mImgCPU: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setdataCPU(data: CPUModel) {
        let price = cutStringmoney.formatMoney(money: String(data.price))
        mLabelCPU.text = data.name
        mLabelPrice.text = price
        mImgCPU.image = UIImage(named: data.url_image)
        let request = ImageRequest(urlRequest: URLRequest(url: URL(string: data.url_image)!))
        Nuke.loadImage(with: request, into: mImgCPU)
    }
}
