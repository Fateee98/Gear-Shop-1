//
// CheckOutViewController.swift
// com.vn.entergroup.Education.gearshop
//
// Created by Huy Trinh Duc on 9/20/18.
// Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit
import Firebase
import RealmSwift
class CheckOutViewController: UIViewController{
    @IBOutlet weak var mNameCustomer: UITextField!
    @IBOutlet weak var mPhoneNumber: UITextField!
    @IBOutlet weak var mAddress: UITextField!
    var ref : DatabaseReference!
    @IBAction func onTouchedCheckOut(_ sender: Any) {
        if (mPhoneNumber.text?.isEmpty)! && (mAddress.text?.isEmpty)! && (mNameCustomer.text?.isEmpty)!
        {
            let alert = UIAlertController(title: "Đặt hàng thất bại!", message: "Vui lòng nhập tên!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        else
        {
            let alert = UIAlertController(title: "Đặt hàng thành công!", message: "Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.saveToFireBase()
        }
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        products = realm.objects(Product.self)
        ref = Database.database().reference().child("Customer")
        self.mPhoneNumber.keyboardType = UIKeyboardType.phonePad
        hideKeyboardWhenTappedAround()
    }
    //save to firebase
    let product = [Product]()
    func saveToFireBase(){
        let key = ref.childByAutoId().key
        var customer = ["id": key,"name": mNameCustomer.text! as String,"address": mAddress.text! as String,"phone":mPhoneNumber.text! as String,"Cart":[]] as [String: Any]
        for item in products{
            let cart : [String: Any] = [
                "Product": item.productName,
                "Price" : item.productPrice
            ]
            var itemProductName = customer["Cart"] as? [[String: Any]] ?? [[String:Any]]()
            itemProductName.append(cart)
            customer["Cart"] = itemProductName
        }
        ref.child(key).setValue(customer)
    }
}

