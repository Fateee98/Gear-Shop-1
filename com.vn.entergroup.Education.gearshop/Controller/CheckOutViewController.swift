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
        let alert = UIAlertController(title: "Đặt hàng thành công!", message: "Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        saveToFireBase()
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        products = realm.objects(Product.self)
        ref = Database.database().reference().child("Customer")
        hideKeyboardWhenTappedAround()
    }
    //save to firebase
    let product = [Product]()
    func saveToFireBase(){
        let key = ref.childByAutoId().key
        for item in products{
            let customer = ["id": key,"name": mNameCustomer.text! as String,"address": mAddress.text! as String,"phone":mPhoneNumber.text! as String,"Cart": [item.productName]] as [String : Any]
            ref.child(key).setValue(customer)
        }
    }
}
