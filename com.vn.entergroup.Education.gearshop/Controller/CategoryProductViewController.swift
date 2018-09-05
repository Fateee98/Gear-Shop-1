//
//  CategoryProductViewController.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/4/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit
import Nuke

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
        if let path = Bundle.main.path(forResource: "document", ofType: "json")
        {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let listData = jsonResult["Cpu"] as? [Any] {
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
    
        switch mScreenType {
        case screenType.cpu:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CPUCollectionViewCell", for: indexPath) as! CPUCollectionViewCell
            cell.setdata(data: arrData[indexPath.row])
            return cell
            break
        case screenType.vga:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VGACollectionViewCell", for: indexPath)
            return cell
            break
        case screenType.ram:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VGACollectionViewCell", for: indexPath)
            return cell
            break
        case screenType.mobo:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VGACollectionViewCell", for: indexPath)
            return cell
            break
            
        default:
            let cell = UICollectionViewCell()
            break
            
        }
        let cell : UICollectionViewCell?
        return cell!
    }
    
    
}
//Extension convert url to image
extension UIImageView {
    
    func downloadImage(from url: String){
        
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}
