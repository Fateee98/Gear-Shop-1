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

class MoreSettingViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var mViewUser: UIView!
    @IBOutlet weak var mLabelUsername: UILabel!
    
    @IBOutlet weak var mUserImage: UIImageView!
    
    var hud = JGProgressHUD(style: .light)
//    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add Refresh Control to Table View
//        if #available(iOS 10.0, *) {
//            self.mViewUser.refreshControl = refreshControl
//        } else {
//            self.mViewUser.addSubview(refreshControl)
//        }
//        
//        self.refreshControl.tintColor = UIColor.lightGray
//        let attributes = [kCTForegroundColorAttributeName: UIColor.lightGray]
//        self.refreshControl.attributedTitle = NSAttributedString(string: "Refreshing Data...", attributes: attributes as [NSAttributedStringKey : Any])
//        
//        self.refreshControl.addTarget(self, action: #selector(fetchUserData), for: .valueChanged)
        
        //get data for each product
        
        let loginButton: FBSDKLoginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        loginButton.readPermissions = ["public_profile", "email"]
        loginButton.delegate = self
        self.view.addSubview(loginButton)
    }

    override func viewWillAppear(_ animated: Bool) {
        hud.textLabel.text = "Đang tải dữ liệu..."
        fetchUserData()
    }
    
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
                    self.mUserImage.image = image
                }
            }
        })
        hud.dismiss()
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("Logged in")
        mUserImage.isHidden = false
        mLabelUsername.isHidden = false
        mViewUser.isHidden = false
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Logged out")
        mUserImage.isHidden = true
        mLabelUsername.isHidden = true
        mViewUser.isHidden = true
    }
}
