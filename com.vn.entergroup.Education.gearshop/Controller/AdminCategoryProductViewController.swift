//
//  CategoryProductViewController.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/4/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit
import FirebaseDatabase
import JGProgressHUD

class AdminCategoryProductViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    @IBOutlet weak var mTableView: UITableView!
    
    //    @IBOutlet weak var mCollectionView: UICollectionView!
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    //Khai bao refresh control
    private let refreshControl = UIRefreshControl()
    var mScreenType = screenType.cpu
    //Array of Product Model
    var mCPUModel = [CPUModel]()
    var mMainModel = [MoboModel]()
    var mRamModel = [RamModel]()
    var mVGAModel = [VGAModel]()
    //Firebase handle
    var ref:DatabaseReference?
    var handle:DatabaseHandle?
    var productData = [String]()
    //Khai bao progress hud
    var hud = JGProgressHUD(style: .light)
    //API to get product data
    let getProduct = API()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            self.mTableView.refreshControl = refreshControl
        } else {
            self.mTableView.addSubview(refreshControl)
        }
        self.refreshControl.tintColor = UIColor.lightGray
        let attributes = [kCTForegroundColorAttributeName: UIColor.lightGray]
        self.refreshControl.attributedTitle = NSAttributedString(string: "Refreshing Data...", attributes: attributes as [NSAttributedStringKey : Any])
        self.refreshControl.addTarget(self, action: #selector(updateData), for: .valueChanged)
        hud.textLabel.text = "Đang tải dữ liệu..."
        refreshProduct()
        hideKeyboardWhenTappedAround()
        //Dang ky xib
        mTableView.register(UINib(nibName: "CPUTableViewCell", bundle: nil), forCellReuseIdentifier: "CPUTableViewCell")
        mTableView.register(UINib(nibName: "VGATableViewCell", bundle: nil), forCellReuseIdentifier: "VGATableViewCell")
        mTableView.register(UINib(nibName: "RamTableViewCell", bundle: nil), forCellReuseIdentifier: "RamTableViewCell")
        mTableView.register(UINib(nibName: "MoboTableViewCell", bundle: nil), forCellReuseIdentifier: "MoboTableViewCell")
        mTableView.tableFooterView = UIView()
        //Set the firebase reference
        ref = Database.database().reference()
        //reload data
        mTableView.reloadData()
        hideKeyboardWhenTappedAround()
    }
    //Function load du lieu cac san pham
    func refreshProduct()
    {
        hud.show(in: self.view)
        getProduct.handleCPUData(type: "Cpu") { (arrCPU) in
            self.mCPUModel = arrCPU
            self.mTableView.reloadData()
            self.hud.dismiss()
        }
        hud.show(in: self.view)
        getProduct.handleVGAData(type: "Vga") { (arrVga) in
            self.mVGAModel = arrVga
            self.mTableView.reloadData()
            self.hud.dismiss()
        }
        hud.show(in: self.view)
        getProduct.handleMoboData(type: "Main") { (arrMobo) in
            self.mMainModel = arrMobo
            self.mTableView.reloadData()
            self.hud.dismiss()
        }
        hud.show(in: self.view)
        getProduct.handleRamData(type: "Ram") { (arrRam) in
            self.mRamModel = arrRam
            self.mTableView.reloadData()
            self.hud.dismiss()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    @objc private func updateData()
    {
        refreshProduct()
        self.mTableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch mScreenType {
        case screenType.cpu:
            if InSearch{
                return mTempSearch.count
            }else{
                return mCPUModel.count
            }
        case screenType.vga:
            if InSearch{
                return mTempSearchVga.count
            }else{
                return mVGAModel.count
            }
        case screenType.ram:
            if InSearch{
                return mTempSearchRam.count
            }else{
                return mRamModel.count
            }
        case screenType.mobo:
            if InSearch{
                return mTempSearchMain.count
            }else{
                return mMainModel.count
            }
        default:
            return 0
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch mScreenType {
        case screenType.cpu:
            if InSearch{
                let cell = tableView.dequeueReusableCell(withIdentifier: "CPUTableViewCell", for: indexPath) as! CPUTableViewCell
                cell.setdataCPU(data: mTempSearch[indexPath.row])
                cell.layer.borderColor = UIColor.gray.cgColor
                cell.layer.borderWidth = 0.2
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "CPUTableViewCell", for: indexPath) as! CPUTableViewCell
                cell.setdataCPU(data: mCPUModel[indexPath.row])
                cell.layer.borderColor = UIColor.gray.cgColor
                cell.layer.borderWidth = 0.2
                return cell
            }
        case screenType.vga:
            if InSearch{
                let cell = tableView.dequeueReusableCell(withIdentifier: "VGATableViewCell", for: indexPath) as! VGATableViewCell
                cell.setdataVGA(data: mTempSearchVga[indexPath.row])
                cell.layer.borderColor = UIColor.gray.cgColor
                cell.layer.borderWidth = 0.2
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "VGATableViewCell", for: indexPath) as! VGATableViewCell
                cell.setdataVGA(data: mVGAModel[indexPath.row])
                cell.layer.borderColor = UIColor.gray.cgColor
                cell.layer.borderWidth = 0.2
                return cell
            }
        case screenType.ram:
            if InSearch{
                let cell = tableView.dequeueReusableCell(withIdentifier: "RamTableViewCell", for: indexPath) as! RamTableViewCell
                cell.setdataRam(data: mTempSearchRam[indexPath.row])
                cell.layer.borderColor = UIColor.gray.cgColor
                cell.layer.borderWidth = 0.2
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "RamTableViewCell", for: indexPath) as! RamTableViewCell
                cell.setdataRam(data: mRamModel[indexPath.row])
                cell.layer.borderColor = UIColor.gray.cgColor
                cell.layer.borderWidth = 0.2
                return cell
            }
        case screenType.mobo:
            if InSearch{
                let cell = tableView.dequeueReusableCell(withIdentifier: "MoboTableViewCell", for: indexPath) as! MoboTableViewCell
                cell.setdataMobo(data: mTempSearchMain[indexPath.row])
                cell.layer.borderColor = UIColor.gray.cgColor
                cell.layer.borderWidth = 0.2
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "MoboTableViewCell", for: indexPath) as! MoboTableViewCell
                cell.setdataMobo(data: mMainModel[indexPath.row])
                cell.layer.borderColor = UIColor.gray.cgColor
                cell.layer.borderWidth = 0.2
                return cell
            }
        default:
            let cell = UITableViewCell()
            break
        }
    }
    
    
    //Chon vao san pham -> trang chi tiet san pham
    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //        let vc = storyboard.instantiateViewController(withIdentifier: "DetailProductViewController") as! DetailProductViewController
    //        switch mScreenType
    //        {
    //        case screenType.cpu:
    //            vc.mCpuProduct = mCPUModel[indexPath.row]
    //            break
    //        case screenType.vga:
    //            vc.mVGaProduct = mVGAModel[indexPath.row]
    //            break
    //        case screenType.ram:
    //            vc.mRamProduct = mRamModel[indexPath.row]
    //            break
    //        case screenType.mobo:
    //            vc.mMainProduct = mMainModel[indexPath.row]
    //            break
    //        default:
    //            return
    //        }
    //        self.navigationController?.pushViewController(vc, animated: true)
    //    }
    
    @IBOutlet weak var mSearch: UISearchBar!
    //Func Search
    var mTempSearch = [CPUModel]()
    var mTempSearchRam = [RamModel]()
    var mTempSearchVga = [VGAModel]()
    var mTempSearchMain = [MoboModel]()
    var InSearch = false
    func search(keyword: String){
        if keyword.replacingOccurrences(of: " ", with: "").count == 0{
            return
        }
        mTempSearch.removeAll()
        mTempSearchRam.removeAll()
        mTempSearchVga.removeAll()
        mTempSearchMain.removeAll()
        //Search phan tu trong tung mang
        for item in mCPUModel{
            if item.name.contains(keyword.uppercased()){
                mTempSearch.append(item)
            }
        }
        for item in mRamModel{
            if item.name.contains(keyword.uppercased()){
                mTempSearchRam.append(item)
            }
        }
        for item in mVGAModel{
            if item.name.contains(keyword.uppercased()){
                mTempSearchVga.append(item)
            }
        }
        for item in mMainModel{
            if item.name.contains(keyword.uppercased()){
                mTempSearchMain.append(item)
            }
        }
        if mTempSearchMain.count > 0{
            InSearch = true
            mTableView.reloadData()
        }
        if mTempSearchVga.count > 0{
            InSearch = true
            mTableView.reloadData()
        }
        if mTempSearchRam.count > 0{
            InSearch = true
            mTableView.reloadData()
        }
        if mTempSearch.count > 0 {
            InSearch = true
            mTableView.reloadData()
        }else{
            InSearch = false
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search(keyword: searchText)
    }
    
    func removeBorderNavigation()
    {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
