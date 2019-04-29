//
//  ShopsViewController.swift
//  Shops
//
//  Created by Ramzi BOUKERI on 29/04/2019.
//  Copyright © 2019 Ramzi BOUKERI. All rights reserved.
//

import UIKit
import SVProgressHUD

class ShopsViewController: UIViewController {
    
    @IBOutlet var shopsViewModel: ShopsViewModel!
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register Shop Cell
        self.tableView.register(UINib(nibName: "ShopCell", bundle: nil), forCellReuseIdentifier: "shopCell")
        
        // Get shops list
        SVProgressHUD.show()
        self.shopsViewModel.fetchShops { (error) in
            SVProgressHUD.dismiss()
            
            DispatchQueue.main.async {
                
                if (error != nil) {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
                self.tableView.reloadData()
            }
        }
    }
}

extension ShopsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopsViewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "shopCell", for: indexPath) as! ShopCell
        let shop: ShopModel = shopsViewModel.shopForItemAtIndexPath(indexPath: indexPath)
        
        cell.configure(withShop: shop)
        
        return cell
    }
}
