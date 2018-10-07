//
//  LoginViewController.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 10/4/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit
import JGProgressHUD
import FacebookCore
import FacebookLogin
import FirebaseAuth
class LoginViewController: UIViewController {

    @IBOutlet weak var mTextFieldUsername: UITextField!
    @IBOutlet weak var mTextFieldPassword: UITextField!
    
    @IBAction func onTouchedRegister(_ sender: Any) {
        let popView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopupRegisterViewController") as! PopupRegisterViewController
        self.addChildViewController(popView)
        popView.view.frame = self.view.frame
        self.view.addSubview(popView.view)
        popView.didMove(toParentViewController: self)
    }
    
    @IBAction func onTouchedLoginButton(_ sender: Any) {
        if (mTextFieldUsername.text?.isEmpty)!
        {
            let alert = UIAlertController(title: "Đăng nhập thất bại!", message: "Vui lòng nhập tên email!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if (mTextFieldPassword.text?.isEmpty)!
        {
            let alert = UIAlertController(title: "Đăng nhập thất bại!", message: "Vui lòng nhập mật khẩu!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if mTextFieldUsername.text == "admin" && mTextFieldPassword.text == "123456"
        {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "AdminViewController") as! AdminViewController
//            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func onTouchedLoginFB(_ sender: Any) {
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        removeBorderNavigation()
    }

//    fileprivate func signIntoFirebase() {
//        guard let authenticationToken = AccessToken.current?.authenticationToken else { return }
//        let credential = FacebookAuthProvider.credential(withAccessToken: authenticationToken)
//        Auth.auth().signIn(with: credential) { (user, err) in
//            if let err = err {
//                Service.dismissHud(self.hud, text: "Sign up error", detailText: err.localizedDescription, delay: 3)
//                return
//            }
//            print("Succesfully authenticated with Firebase.")
//            self.fetchFacebookUser()
//        }
//    }
    
    fileprivate func fetchFacebookUser() {
        
//        let graphRequestConnection = GraphRequestConnection()
//        let graphRequest = GraphRequest(graphPath: "me", parameters: ["fields": "id, email, name, picture.type(large)"], accessToken: AccessToken.current, httpMethod: .GET, apiVersion: .defaultVersion)
//        graphRequestConnection.add(graphRequest, completion: { (httpResponse, result) in
//            switch result {
//            case .success(response: let response):
//
//                guard let responseDict = response.dictionaryValue else { Service.dismissHud(self.hud, text: "Error", detailText: "Failed to fetch user.", delay: 3); return }
//
//                let json = JSON(responseDict)
//                self.name = json["name"].string
//                self.email = json["email"].string
//                guard let profilePictureUrl = json["picture"]["data"]["url"].string else { Service.dismissHud(self.hud, text: "Error", detailText: "Failed to fetch user.", delay: 3); return }
//                guard let url = URL(string: profilePictureUrl) else { Service.dismissHud(self.hud, text: "Error", detailText: "Failed to fetch user.", delay: 3); return }
//
//                URLSession.shared.dataTask(with: url) { (data, response, err) in
//                    if err != nil {
//                        guard let err = err else { Service.dismissHud(self.hud, text: "Error", detailText: "Failed to fetch user.", delay: 3); return }
//                        Service.dismissHud(self.hud, text: "Fetch error", detailText: err.localizedDescription, delay: 3)
//                        return
//                    }
//                    guard let data = data else { Service.dismissHud(self.hud, text: "Error", detailText: "Failed to fetch user.", delay: 3); return }
//                    self.profileImage = UIImage(data: data)
//                    self.saveUserIntoFirebaseDatabase()
//
//                    }.resume()
//
//                break
//            case .failed(let err):
//                Service.dismissHud(self.hud, text: "Error", detailText: "Failed to get Facebook user with error: \(err)", delay: 3)
//                break
//            }
//        })
//        graphRequestConnection.start()
//
//
//    }
    }
    func removeBorderNavigation()
    {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
}
