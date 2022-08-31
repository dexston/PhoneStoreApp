//
//  NetworkManager.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import Foundation

protocol NetworkManagerDelegate: AnyObject {
    func didBestSellerUpdate(data: [Phone])
    func didHotSalesUpdate(data: [HotSale])
    func didFailWithError(error: Error)
}

class NetworkManager {
    
    weak var delegate: NetworkManagerDelegate?
    
    private let urlManager = URLManager()
    
    func fetchHomeStore() async {
        guard let url = urlManager.getHomeStoreURL() else {
            print("Bad url")
            return
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            let decodedData = try decoder.decode(HomeStore.self, from: data)
            DispatchQueue.main.async {
                self.delegate?.didBestSellerUpdate(data: decodedData.bestSeller)
                self.delegate?.didHotSalesUpdate(data: decodedData.homeStore)
            }
        } catch {
            delegate?.didFailWithError(error: error)
        }
    }
    
    func fetchPhoneDetails() async -> PhoneDetails? {
        guard let url = urlManager.getDetailedProductURL() else {
            print("Bad url")
            return nil
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            let decodedData = try decoder.decode(PhoneDetails.self, from: data)
            return decodedData
        } catch {
            print("Bad phone details")
            print(error)
            return nil
        }
    }
    
}
