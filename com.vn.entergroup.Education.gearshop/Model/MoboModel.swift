//
//  MoboModel.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/6/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import Foundation
class MoboModel: BaseModeVO
{
    var chipset_socket = ""
    var cpu_support = ""
    var lan_wireless = ""
    var detail = ""
    
    override init(data: [String: AnyObject]) {
        super.init(data: data)
        chipset_socket = data["chipset_socket"] as? String ?? ""
        cpu_support = data["cpu_support"] as? String ?? ""
        lan_wireless = data["lan_wireless"] as? String ?? ""
        detail = data["detail"] as? String ?? ""
    }
}
