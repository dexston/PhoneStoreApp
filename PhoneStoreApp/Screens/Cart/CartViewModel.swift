//
//  CartViewModel.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import Foundation

class CartViewModel: ObservableObject {
    
    private let networkManager = NetworkManager()
    
    @Published var cart: Cart?
    var basket: [BasketItem] {
        if let cart = cart {
            return cart.basket
        } else {
            return []
        }
    }
    
    func loadCartInfo() async {
        do {
            cart = try await networkManager.fetchCartInfo()
        } catch {
            print(error)
        }
    }
    
}
