//
//  API.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/7/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import Foundation
import FirebaseDatabase
class API
{
    func handleData(type: String,completion: @escaping ([CPUModel]) -> Void)
    {
        let messageDB = Database.database().reference().child(type)
        messageDB.observeSingleEvent(of: .value) { (snapshot) in
            if let snapshotValue = snapshot.value as? [[String: AnyObject]]{
                print(snapshotValue)
                var arrData = [CPUModel]()
                for item in snapshotValue
                {
                    let cpuData = CPUModel(data: item as! [String:AnyObject])
                    arrData.append(cpuData)
                    completion(arrData)
                }
            }
        }
    }
}
