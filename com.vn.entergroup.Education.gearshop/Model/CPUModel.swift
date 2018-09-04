//
//  CPUModel.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/4/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import Foundation
class CPUModel {
    var img = ""
    var title = ""
    var price = ""
    
    init(data: [String: AnyObject]) {
        img = data["img"] as? String ?? ""
        title = data["title"] as? String ?? ""
        price = data["price"] as? String ?? ""
    }
}
