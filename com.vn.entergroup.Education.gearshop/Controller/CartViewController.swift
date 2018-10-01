//
// CartViewController.swift
// com.vn.entergroup.Education.gearshop
//
// Created by Huy Trinh Duc on 9/16/18.
// Copyright © 2018 Huy Trinh Duc. All rights reserved.
//

import UIKit
import Realm
import RealmSwift
import Nuke
//Nhan du lieu realm tu query
var products: Results<Product>!
var realm = try! Realm()
class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //Tong san pham
    @IBOutlet weak var countCart: UILabel!
    //Tong gia cac san pham
    @IBOutlet weak var sumPrice: UILabel!
    //khi an nut thanh toan
    @IBAction func onTouchedCheckOut(_ sender: Any) {
        if products.count == 0
        {
            let alert = UIAlertController(title: "Chưa có sản phẩm nào trong giỏ hàng!", message: "Vui lòng thêm sản phẩm vào giỏ hàng!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "CheckOutViewController") as! CheckOutViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    //Sua
    @IBAction func onTouchedEditCartItem(_ sender: UIBarButtonItem) {
        self.mCartTableView.isEditing = !self.mCartTableView.isEditing
        sender.title = (self.mCartTableView.isEditing) ? "Xong" : "Sửa"
    }
    @IBOutlet weak var mCartTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        products = realm.objects(Product.self)
        mCartTableView.reloadData()
        mCartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
        mCartTableView.tableFooterView = UIView()
        //tinh tong gia cac san pham
        getSum()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Hien tong san pham
        countCart.text = String(products.count)
        //tong gia cac san pham
        getSum()
        mCartTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            try! realm.write {
                realm.delete(products[indexPath.row])
                countCart.text = String(products.count)
                //tong gia cac san pham
                getSum()
            }
        }
        mCartTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell") as! CartTableViewCell
        let product = products[indexPath.row]
        cell.mLabelNameProductCart.text = product.productName
        cell.mLabelPriceProductCart.text = ("\(String(describing: product.productPrice)) VND")
        let request = ImageRequest(urlRequest: URLRequest(url: URL(string: product.url)!))
        Nuke.loadImage(with: request, into: cell.mImgProductCart)
        return cell
    }
    //Tinh tong gia
    func getSum(){
        var a = [Int]()
        a.removeAll()
        for item in products{
            a.append(item.productPrice)
        }
        var sum = 0
        for int in a {
            sum += int
        }
        sumPrice.text = String("\(sum) VND")
    }
}
//Object Product Realm
class Product: Object {
    @objc dynamic var productName = ""
    @objc dynamic var productPrice = 0
    @objc dynamic var url = ""
    convenience init(productName: String,productPrice: Int,url: String) {
        self.init()
        self.productName = productName
        self.productPrice = productPrice
        self.url = url
    }
}

