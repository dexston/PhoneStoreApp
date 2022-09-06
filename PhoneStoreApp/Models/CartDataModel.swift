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
    
    var quantity: Int {
        var result = 0
        basket.forEach { item in
            result += item.quantity
        }
        return result
    }
    
    var totalCost: Int {
        var result = 0
        basket.forEach { item in
            result += item.price * item.quantity
        }
        return result
    }
    
}
