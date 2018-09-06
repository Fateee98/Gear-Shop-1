//
//  VGAModel.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/6/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import Foundation
class VGAModel
{
    var id = ""
    var name = ""
    var price = ""
    var bus_standard = ""
    var resolution = ""
    var video_memory = ""
    var recommend_psu = ""
    var detail = ""
    var url_image = ""
    
    init(data: [String: AnyObject]) {
        id = data["id"] as? String ?? ""
        name = data["name"] as? String ?? ""
        price = data["price"] as? String ?? ""
        bus_standard = data["bus_standard"] as? String ?? ""
        resolution = data["resolution"] as? String ?? ""
        video_memory = data["video_memory"] as? String ?? ""
        recommend_psu = data["recommend_psu"] as? String ?? ""
        detail = data["detail"] as? String ?? ""
        url_image = data["url_image"] as? String ?? ""
    }
}
