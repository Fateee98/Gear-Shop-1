//
//  RamModel.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/6/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import Foundation
class RamModel
{
    var id = ""
    var name = ""
    var price = ""
    var memory = ""
    var bus = ""
    var type = ""
    var detail = ""
    var url_image = ""
    
    init(data: [String: AnyObject]) {
        id = data["id"] as? String ?? ""
        name = data["name"] as? String ?? ""
        price = data["price"] as? String ?? ""
        memory = data["memory"] as? String ?? ""
        bus = data["bus"] as? String ?? ""
        type = data["type"] as? String ?? ""
        detail = data["detail"] as? String ?? ""
        url_image = data["url_image"] as? String ?? ""
    }
}
