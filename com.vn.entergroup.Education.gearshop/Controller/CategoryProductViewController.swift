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
    
    //Array of Product Model
    var mCPUModel = [CPUModel]()
    var mMainModel = [MoboModel]()
    var mRamModel = [RamModel]()
    var mVGAModel = [VGAModel]()
    
    var ref:DatabaseReference?
    var handle:DatabaseHandle?
    var productData = [String]()
    
    //API to get product data
    let getProduct = API()
    
    @IBOutlet weak var testText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get data for each product
        getProduct.handleCPUData(type: "Cpu") { (arrCPU) in
            self.mCPUModel = arrCPU
            self.mCollectionView.reloadData()
        }
        
        getProduct.handleVGAData(type: "Vga") { (arrVga) in
            self.mVGAModel = arrVga
            self.mCollectionView.reloadData()
        }
        
        getProduct.handleMoboData(type: "Main") { (arrMobo) in
            self.mMainModel = arrMobo
            self.mCollectionView.reloadData()
        }
        
        getProduct.handleRamData(type: "Ram") { (arrRam) in
            self.mRamModel = arrRam
            self.mCollectionView.reloadData()
        }
    
        mCollectionView.register(UINib(nibName: "CPUCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CPUCollectionViewCell")
        mCollectionView.register(UINib(nibName: "VGACollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VGACollectionViewCell")
        mCollectionView.register(UINib(nibName: "RamCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RamCollectionViewCell")
        mCollectionView.register(UINib(nibName: "MoboCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MoboCollectionViewCell")
        
        //Set the firebase reference
        ref = Database.database().reference()
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
