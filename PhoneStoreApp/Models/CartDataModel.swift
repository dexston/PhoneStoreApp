//
//  CartDataModel.swift
//  PhoneStoreApp
//
//  Created by Admin on 05.09.2022.
//

import Foundation

struct Cart: Decodable {
    
    let id: String
    let delivery: String
    let total: Int
    let basket: [BasketItem]
    
}
