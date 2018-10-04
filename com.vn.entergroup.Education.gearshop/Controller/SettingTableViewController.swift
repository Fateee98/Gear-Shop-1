//
//  SettingTableViewController.swift
//  com.vn.entergroup.Education.gearshop
//
//  Created by Huy Trinh Duc on 9/27/18.
//  Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FacebookLogin
import FacebookCore
import JGProgressHUD
import FirebaseUI

class SettingTableViewController: UITableViewController, FUIAuthDelegate {

    @IBOutlet var mTableViewSettings: UITableView!
    
    
    @IBOutlet weak var mLabelSignInOut: UILabel!
    
    @IBOutlet weak var onTouchedInfoUser: UITableViewCell!
    @IBOutlet weak var mImgUsername: UIImageView!
    @IBOutlet weak var mLabelEmail: UILabel!
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
        onTouchedInfoUser.isHidden = false
    }
    
    
    //Check da dang nhap hay chua, neu da dang nhap se hien anh va ten nguoi dung, chua thi an?
    func checkLoggedIn() {
        Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil {
                // User is signed in.
//                self.mImgUsername.isHidden = false
//                self.mLabelUsername.isHidden =  false
//                self.mLabelEmail.isHidden = false
//                self.mLabelSignInOut.text = "Đăng xuất"

            } else {
                // No user is signed in.
//                self.mImgUsername.isHidden = true
//                self.mLabelUsername.isHidden =  true
//                self.mLabelEmail.isHidden = true
//                self.mLabelSignInOut.text = "Đăng nhập"
                self.login()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        checkLoggedIn()
        mTableViewSettings.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        hud.textLabel.text = "Đang tải dữ liệu..."
//        fetchUserData()
    }
    
    //Ham lay thong tin nick fb
    @objc private func fetchUserData() {
        hud.show(in: self.tableView)
        let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id, birthday, email, name, picture.width(500).height(500)"])
        graphRequest?.start(completionHandler: { (connection, result, error) in
            if error != nil {
                print("Error",error!.localizedDescription)
            }
            else{
                print(result!)
                let field = result! as? [String:Any]
                self.mLabelUsername.text = field!["name"] as? String
                self.mLabelEmail.text = field!["email"] as? String
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
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if mLabelSignInOut.text == "Đăng nhập"
//        {
//            checkLoggedIn()
//        }
//        else
//        {
//            try! Auth.auth().signOut()
//        }
//    }
}
