//
//  FilterModel.swift
//  PhoneStoreApp
//
//  Created by Admin on 06.09.2022.
//

import Foundation

struct Filter {
    
    var brand: Brand
    var priceRange: PriceRange
    var size: SizeRange
    
    enum Brand: String, CaseIterable {
        case samsung = "Samsung"
        case apple = "Apple"
        case huawei = "Huawei"
        case xiaomi = "Xiaomi"
    }
    enum PriceRange: String, CaseIterable {
        case low = "$0 - $300"
        case medium = "$300 - $500"
        case high = "$500 - ..."
    }
    enum SizeRange: String, CaseIterable {
        case low = "4.5 to 5.5 inches"
        case medium = "5.5 to 6.5 inches"
        case high = "6.5 and more inches"
    }
    
}
