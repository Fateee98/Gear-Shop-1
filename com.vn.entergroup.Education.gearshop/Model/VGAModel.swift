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
//    var id = ""
//    var name = ""
//    var price = ""
    var bus_standard = ""
    var resolution = ""
    var video_memory = ""
    var recommend_psu = ""
    var detail = ""
//    var url_image = ""
    
    override init(data: [String: AnyObject]) {
        super.init(data: data)
        bus_standard = data["bus_standard"] as? String ?? ""
        resolution = data["resolution"] as? String ?? ""
        video_memory = data["video_memory"] as? String ?? ""
        recommend_psu = data["recommend_psu"] as? String ?? ""
        detail = data["detail"] as? String ?? ""
    }
}
