//
//  CheckOutViewController.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/20/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit

class CheckOutViewController: UIViewController {

    
    @IBAction func onTouchedCheckOut(_ sender: Any) {
        let alert = UIAlertController(title: "Đặt hàng thành công!", message: "Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
}
