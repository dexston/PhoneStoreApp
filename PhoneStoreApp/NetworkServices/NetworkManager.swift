//
//  NetworkManager.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import Foundation

enum NetworkErrors: Error {
    case badUrl
}

class NetworkManager {
    
    private let urlManager = URLManager()
    
    func fetchHomeStore() async throws -> HomeStore {
        guard let url = urlManager.getHomeStoreURL() else {
            throw NetworkErrors.badUrl
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let (data,_) = try await URLSession.shared.data(from: url)
        let decodedData = try decoder.decode(HomeStore.self, from: data)
        return decodedData
    }
    
    func fetchPhoneDetails() async throws -> PhoneDetails {
        guard let url = urlManager.getDetailedProductURL() else {
            throw NetworkErrors.badUrl
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let (data,_) = try await URLSession.shared.data(from: url)
        let decodedData = try decoder.decode(PhoneDetails.self, from: data)
        return decodedData
    }
    
}
