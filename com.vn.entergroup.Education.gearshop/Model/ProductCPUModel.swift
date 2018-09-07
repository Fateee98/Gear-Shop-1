//
//  ProductModel.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/6/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import Foundation
class ProductCPUModel
{
    var bus_ram_support = ""
    var core = ""
    var detail = ""
    var id = ""
    var name = ""
    var price = ""
    var socket = ""
    var speed = ""
    var thread = ""
    var url_image = ""
    
    init(data: [String: AnyObject]) {
        bus_ram_support = data["bus_ram_support"] as? String ?? ""
    }
    
}
