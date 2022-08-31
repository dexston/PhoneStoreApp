//
//  URLManager.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import Foundation

class URLManager {
    
    let homeStoreURL = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
    let detailedProductURL = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
    
    func getHomeStoreURL() -> URL? {
        return URL(string: homeStoreURL)
    }
    func getDetailedProductURL() -> URL? {
        return URL(string: detailedProductURL)
    }
    
}
