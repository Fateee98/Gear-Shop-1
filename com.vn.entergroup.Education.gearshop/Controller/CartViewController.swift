//
//  CartViewController.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/16/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    var mScreenType = screenType.cpu
//    var mCpuProductCart : CPUModel?
//    var mVGaProductCart : VGAModel?
//    var mRamProductCart : RamModel?
//    var mMainProductCart : MoboModel?
    
    @IBOutlet weak var mCartTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mCartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell")
        return cell!
    }
    


}
