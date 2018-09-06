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
    
    var arrCPU: [CPUModel] = []
    var arrVGA: [VGAModel] = []
    var arrRam: [RamModel] = []
    var arrMobo: [MoboModel] = []
    
    var ref:DatabaseReference?
    var handle:DatabaseHandle?
    var productData = [String]()
    
    @IBOutlet weak var testText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        loadDataCPU()
//        loadDataVGA()
//        loadDataRam()
//        loadDataMobo()
        handleData()
        mCollectionView.register(UINib(nibName: "CPUCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CPUCollectionViewCell")
        mCollectionView.register(UINib(nibName: "VGACollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VGACollectionViewCell")
        mCollectionView.register(UINib(nibName: "RamCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RamCollectionViewCell")
        mCollectionView.register(UINib(nibName: "MoboCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MoboCollectionViewCell")
        
        //Set the firebase reference
        ref = Database.database().reference()
        
        //Retrieve product from database
        
        
    }
    
    func handleData()
    {
        let messageDB = Database.database().reference().child("Cpu")
        
        messageDB.observe(.childAdded, with: { snapshot in
            
            let snapshotValue = snapshot.value as! NSDictionary
            let name = snapshotValue["name"] as! String
            let price = snapshotValue["price"] as! String
        })
    }
    
    func loadDataCPU() {
        if let path = Bundle.main.path(forResource: "document", ofType: "json")
        {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let listData = jsonResult["Cpu"] as? [Any] {
                    for item in listData {
                        let i = CPUModel(data: item as! [String : AnyObject])
                        arrCPU.append(i)
                    }
                    mCollectionView.reloadData()
                }
            } catch {
                // handle error
            }
        }
    }
    
    func loadDataVGA() {
        if let path = Bundle.main.path(forResource: "document", ofType: "json")
        {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let listData = jsonResult["VGA"] as? [Any] {
                    for item in listData {
                        let i = VGAModel(data: item as! [String : AnyObject])
                        arrVGA.append(i)
                    }
                    mCollectionView.reloadData()
                }
            } catch {
                // handle error
            }
        }
    }
    
    func loadDataRam() {
        if let path = Bundle.main.path(forResource: "document", ofType: "json")
        {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let listData = jsonResult["Ram"] as? [Any] {
                    for item in listData {
                        let i = RamModel(data: item as! [String : AnyObject])
                        arrRam.append(i)
                    }
                    mCollectionView.reloadData()
                }
            } catch {
                // handle error
            }
        }
    }
    
    func loadDataMobo() {
        if let path = Bundle.main.path(forResource: "document", ofType: "json")
        {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let listData = jsonResult["Main"] as? [Any] {
                    for item in listData {
                        let i = MoboModel(data: item as! [String : AnyObject])
                        arrMobo.append(i)
                    }
                    mCollectionView.reloadData()
                }
            } catch {
                // handle error
            }
        }
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch mScreenType {
        case screenType.cpu:
            return arrCPU.count
        case screenType.vga:
            return arrVGA.count
        case screenType.ram:
            return arrRam.count
        case screenType.mobo:
            return arrMobo.count
            
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
            handleData()
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CPUCollectionViewCell", for: indexPath) as! CPUCollectionViewCell
//            cell.setdataCPU(data: arrCPU[indexPath.row])
            return cell
        case screenType.vga:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VGACollectionViewCell", for: indexPath) as! VGACollectionViewCell
            cell.setdataVGA(data: arrVGA[indexPath.row])
            return cell
        case screenType.ram:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RamCollectionViewCell", for: indexPath) as! RamCollectionViewCell
            cell.setdataRam(data: arrRam[indexPath.row])
            return cell
        case screenType.mobo:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoboCollectionViewCell", for: indexPath) as! MoboCollectionViewCell
            cell.setdataMobo(data: arrMobo[indexPath.row])
            return cell
            
        default:
            let cell = UICollectionViewCell()
            break
            
        }
        let cell : UICollectionViewCell?
        return cell!
    }
    
    
}
