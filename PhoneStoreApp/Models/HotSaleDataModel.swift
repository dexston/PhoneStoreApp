//
//  HotSaleDataModel.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import Foundation

struct HotSale: Decodable, Hashable {
    
    let id: Int
    let isNew: Bool?
    let title: String
    let subtitle: String
    let picture: URL?
    let isBuy: Bool
    
}
