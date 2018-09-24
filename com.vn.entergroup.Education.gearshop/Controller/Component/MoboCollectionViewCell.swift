//
//  MoboCollectionViewCell.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/6/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit
import Nuke
class MoboCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mPriceMobo: UILabel!
    @IBOutlet weak var mLabelMobo: UILabel!
    @IBOutlet weak var mImgMobo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setdataMobo(data: MoboModel) {
        mLabelMobo.text = data.name
        mPriceMobo.text = String("\(data.price) VND")
        mImgMobo.image = UIImage(named: data.url_image)
        let request = ImageRequest(urlRequest: URLRequest(url: URL(string: data.url_image)!))
        Nuke.loadImage(with: request, into: mImgMobo)
    }
}
