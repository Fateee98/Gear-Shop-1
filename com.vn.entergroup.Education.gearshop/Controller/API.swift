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
    func handleCPUData(type: String,completion: @escaping ([CPUModel]) -> Void)
    {
        let messageDB = Database.database().reference().child(type)
        messageDB.observeSingleEvent(of: .value) { (snapshot) in
            if let snapshotValue = snapshot.value as? [[String: AnyObject]]{
                var arrCPU = [CPUModel]()
                for item in snapshotValue
                {
                    let cpuData = CPUModel(data: item as! [String:AnyObject])
                    arrCPU.append(cpuData)
                    completion(arrCPU)
                }
            }
        }
    }
    
    func handleVGAData(type: String,completion: @escaping ([VGAModel]) -> Void)
    {
        let messageDB = Database.database().reference().child(type)
        messageDB.observeSingleEvent(of: .value) { (snapshot) in
            if let snapshotValue = snapshot.value as? [[String: AnyObject]]{
                var arrVGA = [VGAModel]()
                for item in snapshotValue
                {
                    let vgaData = VGAModel(data: item as! [String:AnyObject])
                    arrVGA.append(vgaData)
                    completion(arrVGA)
                }
            }
        }
    }
    
    func handleMoboData(type: String,completion: @escaping ([MoboModel]) -> Void)
    {
        let messageDB = Database.database().reference().child(type)
        messageDB.observeSingleEvent(of: .value) { (snapshot) in
            if let snapshotValue = snapshot.value as? [[String: AnyObject]]{
                var arrMobo = [MoboModel]()
                for item in snapshotValue
                {
                    let moboData = MoboModel(data: item as! [String:AnyObject])
                    arrMobo.append(moboData)
                    completion(arrMobo)
                }
            }
        }
    }
    
    func handleRamData(type: String,completion: @escaping ([RamModel]) -> Void)
    {
        let messageDB = Database.database().reference().child(type)
        messageDB.observeSingleEvent(of: .value) { (snapshot) in
            if let snapshotValue = snapshot.value as? [[String: AnyObject]]{
                var arrRam = [RamModel]()
                for item in snapshotValue
                {
                    let ramData = RamModel(data: item as! [String:AnyObject])
                    arrRam.append(ramData)
                    completion(arrRam)
                }
            }
        }
    }
    func formatMoney(money: String) -> String{
        if money == "" {
            return "0 VND"
        }
        var strResult = money
        var k = 0
        for i in (1..<money.count).reversed(){
            k = k+1
            if k%3 == 0{
                let index = money.index(money.startIndex, offsetBy: i)
                strResult.insert(".", at: index)
            }
        }
        strResult = strResult + " VND"
        return strResult
    }
}
