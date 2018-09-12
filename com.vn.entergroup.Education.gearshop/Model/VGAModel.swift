//
//  VGAModel.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/6/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import Foundation
class VGAModel: BaseModeVO
{
    var bus_standard = ""
    var resolution = ""
    var video_memory = ""
    var recommended_PSU = ""
    var detail = ""
    
    override init(data: [String: AnyObject]) {
        super.init(data: data)
        bus_standard = data["bus_standard"] as? String ?? ""
        resolution = data["resolution"] as? String ?? ""
        video_memory = data["video_memory"] as? String ?? ""
        recommended_PSU = data["recommended_PSU"] as? String ?? ""
        detail = data["detail"] as? String ?? ""
    }
}
