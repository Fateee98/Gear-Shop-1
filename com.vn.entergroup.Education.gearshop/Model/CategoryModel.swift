//
//  CategoryModel.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/4/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import Foundation
class CategoryModel
{
    
    //This file call key value of json file
    
    var image = ""
    var title = ""
    
    init(data: [String: AnyObject]) {
        image = data["image"] as? String ?? ""
        title = data["title"] as? String ?? ""
    }
}
