//
//  DetailedViewModel.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import Foundation

class DetailedViewModel: ObservableObject {
    
    private let networkManager = NetworkManager()
    
    @Published var phoneDetails: PhoneDetails?
    
    @Published var selectedColor: String = ""
    @Published var selectedCapacity: String = ""
    
    func loadPhoneDetails() async {
        let details = await networkManager.fetchPhoneDetails()
        DispatchQueue.main.async {
            self.phoneDetails = details
        }
    }
    
}
