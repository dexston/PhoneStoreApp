//
//  BasketDataModel.swift
//  PhoneStoreApp
//
//  Created by Admin on 05.09.2022.
//

import Foundation

struct BasketItem: Decodable {
    
    let id: Int
    let price: Int
    let images: URL
    let title: String
    
}
