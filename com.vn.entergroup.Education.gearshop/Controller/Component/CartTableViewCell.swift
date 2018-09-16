//
//  CartTableViewCell.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/16/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var mLabelNameProductCart: UILabel!
    
    @IBOutlet weak var mImgProductCart: UIImageView!
    
    @IBOutlet weak var mLabelPriceProductCart: UILabel!
    
    
    @IBAction func onTouchedDeleteProductCart(_ sender: Any) {
        print("Delete")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
