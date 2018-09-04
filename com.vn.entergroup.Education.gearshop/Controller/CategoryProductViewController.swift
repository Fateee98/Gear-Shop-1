//
//  CategoryProductViewController.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/4/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit

class CategoryProductViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    var mScreenType = screenType.cpu
    
    var arrData: [CPUModel] = []
    
    @IBOutlet weak var testText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataLocal()
        mCollectionView.register(UINib(nibName: "CPUCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CPUCollectionViewCell")
        mCollectionView.register(UINib(nibName: "VGACollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VGACollectionViewCell")
        switch mScreenType {
        case screenType.cpu:
            
            break
        case screenType.vga:
            
            break
        case screenType.ram:
            
            break
        case screenType.mobo:
            
            break
            
        default:
            break
            
        }
        // Do any additional setup after loading the view.
    }
    
    func loadDataLocal() {
        if let path = Bundle.main.path(forResource: "cpu", ofType: "json")
        {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let listData = jsonResult["data"] as? [Any] {
                    for item in listData {
                        let i = CPUModel(data: item as! [String : AnyObject])
                        arrData.append(i)
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
            return arrData.count
        case screenType.vga:
            return arrData.count
        case screenType.ram:
            return arrData.count
        case screenType.mobo:
            return arrData.count
            
        default:
            return 0
            
        }
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : UICollectionViewCell?
        
        switch mScreenType {
        case screenType.cpu:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CPUCollectionViewCell", for: indexPath) as! CPUCollectionViewCell
            cell.setdata(data: arrData[indexPath.row])
            break
        case screenType.vga:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VGACollectionViewCell", for: indexPath)
            break
        case screenType.ram:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VGACollectionViewCell", for: indexPath)
            break
        case screenType.mobo:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VGACollectionViewCell", for: indexPath)
            break
            
        default:
            cell = UICollectionViewCell()
            break
            
        }
        return cell!
    }
    
    
}
