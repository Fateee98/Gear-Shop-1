//
//  PopupRegisterViewController.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 10/5/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit
import FirebaseAuth
class PopupRegisterViewController: UIViewController {

    @IBOutlet weak var mPopupView: UIView!
    
    @IBAction func onTouchedCancel(_ sender: Any) {
//        self.view.removeFromSuperview()
        self.closeAnimation()
    }
    
    @IBAction func onTouchedRegister(_ sender: Any) {
        if (mTextFieldUsername.text?.isEmpty)! {
            let alert = UIAlertController(title: "Đăng ký thất bại!", message: "Vui lòng nhập email!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if (mTextFieldPassword.text?.isEmpty)!
        {
            let alert = UIAlertController(title: "Đăng ký thất bại!", message: "Vui lòng nhập mật khẩu!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            Auth.auth().createUser(withEmail: mTextFieldUsername.text!, password: mTextFieldPassword.text!) { (authResult, error) in
                
            }
            let alert = UIAlertController(title: "Đăng ký thành công!", message: "Bạn có thể tắt cửa sổ này và đăng nhập", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var mTextFieldUsername: UITextField!
    
    @IBOutlet weak var mTextFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimation()
    }
    
    func showAnimation()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    func closeAnimation()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        })
    }
}

