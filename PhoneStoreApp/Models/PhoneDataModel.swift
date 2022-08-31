//
//  PhoneDataModel.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import Foundation

struct Phone: Decodable {
    
    let id: Int
    let isFavorites: Bool
    let title: String
    let priceWithoutDiscount: Int
    let discountPrice: Int
    let picture: URL?
    
}

struct PhoneDetails: Decodable {
    
    let id: String
    let title: String
    let CPU: String
    let camera: String
    let capacity: [String]
    let color: [String]
    let images: [String]
    let isFavorites: Bool
    let price: Int
    let rating: Double
    let sd: String
    let ssd: String
    
}
