//
//  HomeViewController.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/4/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrayData : [CategoryModel] = []

    @IBOutlet weak var mGearItemTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mGearItemTableView.register(UINib(nibName: "GearItemTableViewCell", bundle: nil), forCellReuseIdentifier: "GearItemTableViewCell")
        mGearItemTableView.delegate = self
        mGearItemTableView.dataSource = self
        mGearItemTableView.tableFooterView = UIView()
        loadFakeData()
        removeBorderNavigation()
        self.mGearItemTableView.separatorStyle = .none
    }

    func removeBorderNavigation()
    {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    //Load fake data from json to tableview
    func loadFakeData() {
        if let path = Bundle.main.path(forResource: "gearitem", ofType: "json")
        {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let listData = jsonResult["data"] as? [Any] {
                    for item in listData {
                        let i = CategoryModel(data: item as! [String : AnyObject])
                        arrayData.append(i)
                    }
                    mGearItemTableView.reloadData()
                }
            } catch {
                print("Error load json")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GearItemTableViewCell") as! GearItemTableViewCell
        cell.setData(data: arrayData[indexPath.row])
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        
        let currentCell = tableView.cellForRow(at: indexPath!) as UITableViewCell?
        
        print("Did select")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CategoryProductViewController") as! CategoryProductViewController
        vc.mScreenType = screenType(rawValue: indexPath!.row)!
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}
    


