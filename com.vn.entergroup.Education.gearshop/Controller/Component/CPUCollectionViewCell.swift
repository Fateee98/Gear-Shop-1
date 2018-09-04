//
//  CPUCollectionViewCell.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/4/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit

class CPUCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mLabelCPU: UILabel!
    @IBOutlet weak var mLabelPrice: UILabel!
    @IBOutlet weak var mImgCPU: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setdata(data: CPUModel) {
        mLabelCPU.text = data.title
        mLabelPrice.text = data.price
        mImgCPU.image = UIImage(named: data.img)
    }
}
