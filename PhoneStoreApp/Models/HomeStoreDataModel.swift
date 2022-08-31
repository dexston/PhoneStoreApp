//
//  HomeStoreDataModel.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import Foundation

struct HomeStore: Decodable {
    
    let homeStore: [HotSale]
    let bestSeller: [Phone]
    
}
