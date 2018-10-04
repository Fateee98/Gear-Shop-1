//
//  MoboTableViewCell.swift
//  Gear Shop Management
//
//  Created by Huy Trinh Duc on 10/2/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit
import Nuke

class MoboTableViewCell: UITableViewCell {

    var cutStringmoney = API()
    
    @IBOutlet weak var mImgMobo: UIImageView!
    
    @IBOutlet weak var mLabelMoboName: UILabel!
    
    @IBOutlet weak var mLabelMoboPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setdataMobo(data: MoboModel) {
        let price = cutStringmoney.formatMoney(money: String(data.price))
        mLabelMoboName.text = data.name
        mLabelMoboPrice.text = price
        mImgMobo.image = UIImage(named: data.url_image)
        let request = ImageRequest(urlRequest: URLRequest(url: URL(string: data.url_image)!))
        Nuke.loadImage(with: request, into: mImgMobo)
    }
}
