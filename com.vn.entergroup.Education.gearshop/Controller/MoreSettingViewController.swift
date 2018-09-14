//
//  MoreSettingViewController.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/11/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FacebookLogin
import FacebookCore
import JGProgressHUD
import FirebaseUI

class MoreSettingViewController: UIViewController, FUIAuthDelegate{
    
    
    @IBOutlet weak var mButtonLogin: UIButton!
    
    //Dang nhap
    @IBAction func onTouchedLogin(_ sender: Any) {
        checkLoggedIn()
    }
    
    @IBOutlet weak var mButtonLogout: UIButton!
    
    
    //Dang xuat
    @IBAction func onTappedLogout(_ sender: Any) {
        try! Auth.auth().signOut()
    }
    
    @IBOutlet weak var mImgUsername: UIImageView!
    
    @IBOutlet weak var mLabelUsername: UILabel!
    
    var hud = JGProgressHUD(style: .light)
//    private let refreshControl = UIRefreshControl()
    
    //Check loi dang nhap
//    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
//        if error != nil {
//            //Problem signing in
//            login()
//        }else {
//            //User is in! Here is where we code after signing in
//
//        }
//    }
    
    //Login FB bang firebase ui
    func login()
    {
        let authUI = FUIAuth.defaultAuthUI()
        let fbprod = FUIFacebookAuth()
        authUI?.delegate = self
        authUI?.providers = [fbprod]
        let moreVC = authUI?.authViewController()
        let authViewController = authUI?.authViewController()
        self.present(authViewController!, animated: true, completion: nil)
    }
    
    
    //Check da dang nhap hay chua, neu da dang nhap se hien anh va ten nguoi dung, chua thi an?
    func checkLoggedIn() {
        Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil {
                // User is signed in.
                self.mImgUsername.isHidden = false
                self.mLabelUsername.isHidden =  false
                self.mButtonLogout.isHidden = false
                self.mButtonLogin.isHidden = true
            } else {
                // No user is signed in.
                self.mImgUsername.isHidden = true
                self.mLabelUsername.isHidden =  true
                self.mButtonLogout.isHidden = true
                self.mButtonLogin.isHidden = false
                self.login()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLoggedIn()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        hud.textLabel.text = "Đang tải dữ liệu..."
        fetchUserData()
    }
    
    //Ham lay thong tin nick fb
    @objc private func fetchUserData() {
        hud.show(in: self.view)
        let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id, email, name, picture.width(480).height(480)"])
        graphRequest?.start(completionHandler: { (connection, result, error) in
            if error != nil {
                print("Error",error!.localizedDescription)
            }
            else{
                print(result!)
                let field = result! as? [String:Any]
                self.mLabelUsername.text = field!["name"] as? String
                if let imageURL = ((field!["picture"] as? [String: Any])?["data"] as? [String: Any])?["url"] as? String {
                    print(imageURL)
                    let url = URL(string: imageURL)
                    let data = NSData(contentsOf: url!)
                    let image = UIImage(data: data! as Data)
                    self.mImgUsername.image = image
                }
            }
        })
        hud.dismiss()
    }
    
}
