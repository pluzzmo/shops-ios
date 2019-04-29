//
//  ShopsViewController.swift
//  Shops
//
//  Created by Ramzi BOUKERI on 29/04/2019.
//  Copyright © 2019 Ramzi BOUKERI. All rights reserved.
//

import UIKit

class ShopsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register Shop Cell
        self.tableView.register(UINib(nibName: "ShopCell", bundle: nil), forCellReuseIdentifier: "shopCell")
    }
}

extension ShopsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "shopCell", for: indexPath) as! ShopCell
        
        return cell
    }
}
