//
//  BaseModeVO.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Fate on 9/11/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import Foundation

class BaseModeVO
{
    var id = ""
    var name = ""
    var price: Int
    var url_image = ""
    
    init(data: [String: AnyObject]) {
        id = data["id"] as? String ?? ""
        name = data["name"] as? String ?? ""
        price = data["price"] as! Int
        url_image = data["url_image"] as? String ?? ""
}
}

