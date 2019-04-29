//
//  ShopsModel.swift
//  Shops
//
//  Created by Ramzi BOUKERI on 29/04/2019.
//  Copyright © 2019 Ramzi BOUKERI. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ShopsModel: NSObject {
    
    // MARK: - Constants
    
    static let shopsUrl = "https://www.leshabitues.fr/testapi/shops"
    
    // MARK: - Methods
    
    func fetchShopsData(completion: @escaping (_ shops: [ShopModel]?, _ error: Error?) -> ()) {
        
        // Fetch the data
        Alamofire.request(ShopsModel.shopsUrl).responseJSON(completionHandler: { (response) in
            
            switch response.result {
                
            // Success
            case .success(let value):
                let json = JSON(value)
                var shops: [ShopModel] = []
                
                // Parse JSON
                json["results"].array?.forEach({ (shop) in
                    
                    let shop = ShopModel(identifier: shop["id"].doubleValue,
                                         shopId: shop["shop_id"].doubleValue,
                                         latitude: shop["latitude"].stringValue,
                                         longitude: shop["longitude"].stringValue,
                                         distance: shop["distance"].stringValue,
                                         name: shop["name"].stringValue,
                                         chain: shop["chain"].stringValue,
                                         address: shop["address"].stringValue,
                                         zipcode: shop["zipcode"].stringValue,
                                         city: shop["city"].stringValue,
                                         categoryId: shop["category_id"].doubleValue,
                                         categoryName: shop["category_name"].stringValue,
                                         logoUrl: shop["logo"].stringValue,
                                         cover: shop["cover"].stringValue,
                                         maxOffer: shop["maxoffer"].stringValue,
                                         currency: shop["currency"].stringValue)
                    
                    // Add object to shop list
                    shops.append(shop)
                })
                completion(shops, nil)
                return
                
            // Failure
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil, error)
                return
            }
        })
    }
}
