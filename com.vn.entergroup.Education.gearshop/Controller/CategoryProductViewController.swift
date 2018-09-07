//
//  CategoryProductViewController.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/4/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CategoryProductViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    var mScreenType = screenType.cpu
    
    var mCPUModel = [CPUModel]()
    var mMainModel = [MoboModel]()
    var mRamModel = [RamModel]()
    var mVGAModel = [VGAModel]()
    
    var ref:DatabaseReference?
    var handle:DatabaseHandle?
    var productData = [String]()
    
    @IBOutlet weak var testText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handleCPUData(type: "Cpu") { (arrCPU) in
            self.mCPUModel = arrCPU
            self.mCollectionView.reloadData()
        }
        
        handleMoboData(type: "Main") { (arrMobo) in
            self.mMainModel = arrMobo
            self.mCollectionView.reloadData()
        }
        
        handleVGAData(type: "Vga") { (arrVGA) in
            self.mVGAModel = arrVGA
            self.mCollectionView.reloadData()
        }
        
        handleRamData(type: "Ram") { (arrRam) in
            self.mRamModel = arrRam
            self.mCollectionView.reloadData()
        }
        
        
        mCollectionView.register(UINib(nibName: "CPUCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CPUCollectionViewCell")
        mCollectionView.register(UINib(nibName: "VGACollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VGACollectionViewCell")
        mCollectionView.register(UINib(nibName: "RamCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RamCollectionViewCell")
        mCollectionView.register(UINib(nibName: "MoboCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MoboCollectionViewCell")
        
        //Set the firebase reference
        ref = Database.database().reference()
        
        //Retrieve product from database
        
        
    }
    
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


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch mScreenType {
        case screenType.cpu:
            return mCPUModel.count
        case screenType.vga:
            return mVGAModel.count
        case screenType.ram:
            return mRamModel.count
        case screenType.mobo:
            return mMainModel.count
            
        default:
            return 0
            
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailProductViewController") as! DetailProductViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        switch mScreenType {
        case screenType.cpu:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CPUCollectionViewCell", for: indexPath) as! CPUCollectionViewCell
            cell.setdataCPU(data: mCPUModel[indexPath.row])
            return cell
        case screenType.vga:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VGACollectionViewCell", for: indexPath) as! VGACollectionViewCell
            cell.setdataVGA(data: mVGAModel[indexPath.row])
            return cell
        case screenType.ram:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RamCollectionViewCell", for: indexPath) as! RamCollectionViewCell
            cell.setdataRam(data: mRamModel[indexPath.row])
            return cell
        case screenType.mobo:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoboCollectionViewCell", for: indexPath) as! MoboCollectionViewCell
            cell.setdataMobo(data: mMainModel[indexPath.row])
            return cell
            
        default:
            let cell = UICollectionViewCell()
            break
            
        }
        let cell : UICollectionViewCell?
        return cell!
    }
    
    
}
