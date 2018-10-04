//
//  RamTableViewCell.swift
//  Gear Shop Management
//
//  Created by Huy Trinh Duc on 10/2/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit
import Nuke
class RamTableViewCell: UITableViewCell {
    var cutStringmoney = API()

    @IBOutlet weak var mImgRam: UIImageView!
    
    @IBOutlet weak var mLabelRamName: UILabel!
    
    @IBOutlet weak var mLabelRamPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setdataRam(data: RamModel) {
        let price = cutStringmoney.formatMoney(money: String(data.price))
        mLabelRamName.text = data.name
        mLabelRamPrice.text = price
        mImgRam.image = UIImage(named: data.url_image)
        let request = ImageRequest(urlRequest: URLRequest(url: URL(string: data.url_image)!))
        Nuke.loadImage(with: request, into: mImgRam)
    }
    
}
