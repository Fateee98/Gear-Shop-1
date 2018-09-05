//
//  CPUModel.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/4/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import Foundation
class CPUModel {
    var id = ""
    var name = ""
    var price = ""
    var socket = ""
    var speed = ""
    var core = ""
    var thread = ""
    var bus_ram_support = ""
    var detail = ""
    var url_image = ""
    
    init(data: [String: AnyObject]) {
        id = data["id"] as? String ?? ""
        name = data["name"] as? String ?? ""
        price = data["price"] as? String ?? ""
        socket = data["socket"] as? String ?? ""
        speed = data["speed"] as? String ?? ""
        core = data["core"] as? String ?? ""
        thread = data["thread"] as? String ?? ""
        bus_ram_support = data["bus_ram_support"] as? String ?? ""
        detail = data["detail"] as? String ?? ""
        url_image = data["url_image"] as? String ?? ""
    }
}
