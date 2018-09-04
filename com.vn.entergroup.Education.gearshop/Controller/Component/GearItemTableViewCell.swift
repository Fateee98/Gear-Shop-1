//
//  GearItemTableViewCell.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/4/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit

class GearItemTableViewCell: UITableViewCell {

    
    @IBOutlet weak var mButtonTextCPU: UILabel!
    
    @IBOutlet weak var mImgCPU: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: CategoryModel)
    {
        mButtonTextCPU.text = data.title
        mImgCPU.image = UIImage(named: data.image)
    }
    
}
