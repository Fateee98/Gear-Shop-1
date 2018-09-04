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
    
    
    @IBOutlet weak var testText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        mCollectionView.register(UINib(nibName: "CPUCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CPUCollectionViewCell")
        mCollectionView.register(UINib(nibName: "VGACollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VGACollectionViewCell")
        switch mScreenType {
        case screenType.cpu:
            testText.text = "cpu"
            break
        case screenType.vga:
            testText.text = "vga"
            break
        case screenType.ram:
            testText.text = "ram"
            break
        case screenType.mobo:
            testText.text = "mobo"
            break
            
        default:
            break
            
        }
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch mScreenType {
        case screenType.cpu:
            return 10
        case screenType.vga:
            return 5
        case screenType.ram:
            return 7
        case screenType.mobo:
            return 8
            
        default:
            return 0
            
        }
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : UICollectionViewCell?
        
        switch mScreenType {
        case screenType.cpu:
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CPUCollectionViewCell", for: indexPath)
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
