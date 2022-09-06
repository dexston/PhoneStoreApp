//
//  CartDataModel.swift
//  PhoneStoreApp
//
//  Created by Admin on 05.09.2022.
//

import Foundation

struct Cart: Decodable {
    
    let id: String
    var delivery: String
    var total: Int
    var basket: [BasketItem]
    
}
