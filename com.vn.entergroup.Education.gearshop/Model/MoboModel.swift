//
//  MoboModel.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/6/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import Foundation
class MoboModel
{
    var id = ""
    var name = ""
    var price = ""
    var chipset_socket = ""
    var CPU_support = ""
    var RAM = ""
    var Lan_Wireless = ""
    var detail = ""
    var url_image = ""
    
    init(data: [String: AnyObject]) {
        id = data["id"] as? String ?? ""
        name = data["name"] as? String ?? ""
        price = data["price"] as? String ?? ""
        chipset_socket = data["chipset_socket"] as? String ?? ""
        CPU_support = data["CPU_support"] as? String ?? ""
        RAM = data["RAM"] as? String ?? ""
        Lan_Wireless = data["Lan_Wireless"] as? String ?? ""
        detail = data["detail"] as? String ?? ""
        url_image = data["url_image"] as? String ?? ""
    }
}
