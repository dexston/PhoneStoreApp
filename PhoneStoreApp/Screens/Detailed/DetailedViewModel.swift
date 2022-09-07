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
    
    @MainActor func loadPhoneDetails() async {
        if phoneDetails == nil {
            do {
                let details = try await networkManager.fetchPhoneDetails()
                phoneDetails = details
            } catch {
                print(error)
            }
        }
    }
    
    func likeToggle() {
        if phoneDetails != nil {
            phoneDetails!.isFavorites.toggle()
        }
    }
}
