//
//  ShopsViewModel.swift
//  Shops
//
//  Created by Ramzi BOUKERI on 29/04/2019.
//  Copyright © 2019 Ramzi BOUKERI. All rights reserved.
//

import UIKit

class ShopsViewModel: NSObject {
    
    var shopsModel: ShopsModel!
    var shops: [ShopModel]?
    
    func numberOfRowsInSection(section: Int) -> Int {
        return shops?.count ?? 0
    }
    
    func shopForItemAtIndexPath(indexPath: IndexPath) -> ShopModel {
        return (self.shops?[indexPath.row])!
    }
    
    func fetchShops(completion: @escaping (_ error: Error?) -> ()) {
        
        // Fetch Shops
        self.shopsModel.fetchShopsData(completion: { (shops, err) in
            self.shops = shops
            completion(err)
        })
    }
}
