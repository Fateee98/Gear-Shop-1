//
//  RamModel.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/6/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import Foundation
class RamModel: BaseModeVO
{
    var memory = ""
    var bus = ""
    var type = ""
    var detail = ""
    
    override init(data: [String: AnyObject]) {
        super.init(data: data)

        memory = data["memory"] as? String ?? ""
        bus = data["bus"] as? String ?? ""
        type = data["type"] as? String ?? ""
        detail = data["detail"] as? String ?? ""
    }
}
