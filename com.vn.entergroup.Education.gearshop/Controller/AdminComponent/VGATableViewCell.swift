//
//  VGATableViewCell.swift
//  Gear Shop Management
//
//  Created by Huy Trinh Duc on 10/2/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit
import Nuke
class VGATableViewCell: UITableViewCell {
    var cutStringmoney = API()
    
    @IBOutlet weak var mImgVGA: UIImageView!
    
    @IBOutlet weak var mLabelVGAName: UILabel!
    @IBOutlet weak var mLabelVGAPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setdataVGA(data: VGAModel) {
        let price = cutStringmoney.formatMoney(money: String(data.price))
        mLabelVGAName.text = data.name
        mLabelVGAPrice.text = price
        mImgVGA.image = UIImage(named: data.url_image)
        let request = ImageRequest(urlRequest: URLRequest(url: URL(string: data.url_image)!))
        Nuke.loadImage(with: request, into: mImgVGA)
    }
}
