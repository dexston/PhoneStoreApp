//
//  URLManager.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import Foundation

class URLManager {
    
    private let homeStoreURL = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
    private let detailedProductURL = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
    private let cartURL = "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
    
    func getHomeStoreURL() -> URL? {
        return URL(string: homeStoreURL)
    }
    func getDetailedProductURL() -> URL? {
        return URL(string: detailedProductURL)
    }
    func getCartURL() -> URL? {
        return URL(string: cartURL)
    }
    
}
