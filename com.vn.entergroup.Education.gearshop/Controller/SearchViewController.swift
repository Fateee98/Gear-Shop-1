////
////  SearchViewController.swift
////  com.vn.entergroup.Education.gearshop
////
////  Created by Fate on 9/11/18.
////  Copyright © 2018 Huy Trinh Duc. All rights reserved.
////
//
//import UIKit
//import FirebaseDatabase
//import JGProgressHUD
//
//class SearchViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UISearchBarDelegate, UICollectionViewDelegateFlowLayout{
//
//    var mScreenType = screenType.cpu
//    @IBOutlet weak var mSearchBar: UISearchBar!
//    @IBOutlet weak var collectionSearchView: UICollectionView!
//    //Array of product model
//    var mInSearch = false
//    var mBaseList = [BaseModeVO]()
//    var mTempSearchList = [BaseModeVO]()
//
//    var mCPUModelSearch = [CPUModel]()
//    var mMainModelSearch = [MoboModel]()
//    var mRamModelSearch = [RamModel]()
//    var mVGAModelSearch = [VGAModel]()
//
//    var ref:DatabaseReference?
//    var handle:DatabaseHandle?
//
//    var screenSize: CGRect!
//    var screenWidth: CGFloat!
//    var screenHeight: CGFloat!
//    private let refreshControl = UIRefreshControl()
//    var hud = JGProgressHUD(style: .light)
//    //API to get product data
//    let getProduct = API()
//    func search(keyword: String){
//        if keyword.replacingOccurrences(of: " ", with: "").count == 0 {
//            return
//        }
//        mTempSearchList.removeAll()
//        for item in mBaseList{
//            if item.name.uppercased().contains(keyword.uppercased()){
//                mTempSearchList.append(item)
//            }
//        }
//
//        if mTempSearchList.count > 0{
//            mInSearch = true
//            collectionSearchView.reloadData()
//        }else{
//            mInSearch = false
//        }
//
//        //        if mBuildingList!.list[index].name.uppercased().contains(keyword.uppercased()) {
//        //            mTempList.append(mBuildingList!.list[index])
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        screenSize = UIScreen.main.bounds
//        screenWidth = screenSize.width
//        screenHeight = screenSize.height
//
//        // Add Refresh Control to Table View
//        if #available(iOS 10.0, *) {
//            self.collectionSearchView.refreshControl = refreshControl
//        } else {
//            self.collectionSearchView.addSubview(refreshControl)
//        }
//        removeBorderNavigation()
//        self.refreshControl.tintColor = UIColor.lightGray
//        let attributes = [kCTForegroundColorAttributeName: UIColor.lightGray]
//        self.refreshControl.attributedTitle = NSAttributedString(string: "Refreshing Data...", attributes: attributes as [NSAttributedStringKey : Any])
//
//        self.refreshControl.addTarget(self, action: #selector(updateData), for: .valueChanged)
//
//        hud.textLabel.text = "Đang tải dữ liệu..."
//
//        refreshProduct()
//
//        hideKeyboardWhenTappedAround()
//
//        //Register xib
//        collectionSearchView.register(UINib(nibName: "CPUCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CPUCollectionViewCell")
//        collectionSearchView.register(UINib(nibName: "VGACollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VGACollectionViewCell")
//        collectionSearchView.register(UINib(nibName: "RamCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RamCollectionViewCell")
//        collectionSearchView.register(UINib(nibName: "MoboCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MoboCollectionViewCell")
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vcfull = storyboard.instantiateViewController(withIdentifier: "DetailProductViewController") as! DetailProductViewController
//        switch mScreenType
//        {
//        case screenType.cpu:
////            vcfull.mCpuProduct = mCPUModelSearch[indexPath.row]
//            vcfull.mAllProduct = mBaseList[indexPath.row]
//            break
//        case screenType.vga:
////            vcfull.mVGaProduct = mVGAModelSearch[indexPath.row]
//            vcfull.mAllProduct = mBaseList[indexPath.row]
//            break
//        case screenType.ram:
////            vcfull.mRamProduct = mRamModelSearch[indexPath.row]
//            vcfull.mAllProduct = mBaseList[indexPath.row]
//            break
//        case screenType.mobo:
////            vcfull.mMainProduct = mMainModelSearch[indexPath.row]
//            vcfull.mAllProduct = mBaseList[indexPath.row]
//            break
//        default:
//            return
//        }
////        vcfull.mAllProduct = mBaseList[indexPath.row]
//        self.navigationController?.pushViewController(vcfull, animated: true)
//        print(navigationController)
//    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        search(keyword: searchText)
//    }
//
//    func refreshProduct()
//    {
//        //Get product
//        hud.show(in: self.view)
//        getProduct.handleCPUData(type: "Cpu") { (arrCPU) in
//            for item in arrCPU {
//                self.mBaseList.append(item)
//            }
//            self.collectionSearchView.reloadData()
//            self.hud.dismiss()
//        }
//        hud.show(in: self.view)
//        getProduct.handleVGAData(type: "Vga") { (arrVga) in
//            for item in arrVga {
//                self.mBaseList.append(item)
//            }
//
//            self.collectionSearchView.reloadData()
//            self.hud.dismiss()
//        }
//        hud.show(in: self.view)
//        getProduct.handleMoboData(type: "Main") { (arrMobo) in
//            for item in arrMobo {
//                self.mBaseList.append(item)
//            }
//
//            self.collectionSearchView.reloadData()
//            self.hud.dismiss()
//        }
//        hud.show(in: self.view)
//        getProduct.handleRamData(type: "Ram") { (arrRam) in
//            for item in arrRam {
//                self.mBaseList.append(item)
//            }
//            self.collectionSearchView.reloadData()
//            self.hud.dismiss()
//        }
//    }
//
//    func removeBorderNavigation()
//    {
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//    }
//
//    @objc private func updateData()
//    {
//        refreshProduct()
//        self.collectionSearchView.reloadData()
//        self.refreshControl.endRefreshing()
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if indexPath.row == 0
//        {
//            return CGSize(width: screenWidth/2, height: screenWidth/1.5)
//        }
//        return CGSize(width: screenWidth/2, height: screenWidth/1.5)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if mInSearch{
//            return mTempSearchList.count
//        }
//        return mBaseList.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if mInSearch {
//            if let cpuModel =  mTempSearchList[indexPath.row] as? CPUModel {
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CPUCollectionViewCell", for: indexPath) as! CPUCollectionViewCell
//                cell.setdataCPU(data: cpuModel)
//                return cell
//            } else if let vgaModel =  mTempSearchList[indexPath.row] as? VGAModel {
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VGACollectionViewCell", for: indexPath) as! VGACollectionViewCell
//                cell.setdataVGA(data: vgaModel)
//                return cell
//            } else if let ramModel =  mTempSearchList[indexPath.row] as? RamModel {
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RamCollectionViewCell", for: indexPath) as! RamCollectionViewCell
//                cell.setdataRam(data: ramModel)
//                return cell
//            } else if let mainModel =  mTempSearchList[indexPath.row] as? MoboModel {
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoboCollectionViewCell", for: indexPath) as! MoboCollectionViewCell
//                cell.setdataMobo(data: mainModel)
//                return cell
//            }
//        }else{
//            if let cpuModel =  mBaseList[indexPath.row] as? CPUModel {
//
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CPUCollectionViewCell", for: indexPath) as! CPUCollectionViewCell
//                cell.setdataCPU(data: cpuModel)
//                return cell
//            } else if let vgaModel =  mBaseList[indexPath.row] as? VGAModel {
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VGACollectionViewCell", for: indexPath) as! VGACollectionViewCell
//                cell.setdataVGA(data: vgaModel)
//                return cell
//            } else if let ramModel =  mBaseList[indexPath.row] as? RamModel {
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RamCollectionViewCell", for: indexPath) as! RamCollectionViewCell
//                cell.setdataRam(data: ramModel)
//                return cell
//            } else if let mainModel =  mBaseList[indexPath.row] as? MoboModel {
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoboCollectionViewCell", for: indexPath) as! MoboCollectionViewCell
//                cell.setdataMobo(data: mainModel)
//                return cell
//            }
//        }
//        //            if let cpuModel =  mBaseList[indexPath.row] as? CPUModel {
//        //
//        //                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CPUCollectionViewCell", for: indexPath) as! CPUCollectionViewCell
//        //                cell.setdataCPU(data: cpuModel)
//        //                return cell
//        //            } else if let vgaModel =  mBaseList[indexPath.row] as? VGAModel {
//        //                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VGACollectionViewCell", for: indexPath) as! VGACollectionViewCell
//        //                cell.setdataVGA(data: vgaModel)
//        //                return cell
//        //            } else if let ramModel =  mBaseList[indexPath.row] as? RamModel {
//        //                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RamCollectionViewCell", for: indexPath) as! RamCollectionViewCell
//        //                cell.setdataRam(data: ramModel)
//        //                return cell
//        //            } else if let mainModel =  mBaseList[indexPath.row] as? MoboModel {
//        //                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoboCollectionViewCell", for: indexPath) as! MoboCollectionViewCell
//        //                cell.setdataMobo(data: mainModel)
//        //                return cell
//        //            }
//
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RamCollectionViewCell", for: indexPath) as! RamCollectionViewCell
//        return cell
//    }
//
//
//}
//
