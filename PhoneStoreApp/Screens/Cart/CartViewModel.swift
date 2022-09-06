//
//  CartViewModel.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import Foundation
import SwiftUI

class CartViewModel: ObservableObject {
    
    private let networkManager = NetworkManager()
    
    @Published var cart: Cart?
    
    var basket: [BasketItem] {
        cart?.basket ?? []
    }
    var totalCost: Int {
        cart?.total ?? 0
    }
    var deliveryCost: String {
        cart?.delivery ?? "0"
    }
    
    @MainActor func loadCartInfo() async {
        do {
            cart = try await networkManager.fetchCartInfo()
        } catch {
            print(error)
        }
    }
    
    func quantityOperation(type: K.QuantityOperationType, item: BasketItem) {
        var tempBasket = basket
        for i in tempBasket.indices {
            if tempBasket[i].id == item.id {
                switch type {
                case .minus:
                    if tempBasket[i].quantity == 1 {
                        tempBasket.remove(at: i)
                        break
                    } else {
                        tempBasket[i].quantity -= 1
                        break
                    }
                case .plus:
                    tempBasket[i].quantity += 1
                    break
                case .remove:
                    tempBasket.remove(at: i)
                    break
                }
            }
        }
        cart?.basket = tempBasket
        calculateTotalCost()
    }
    
    func calculateTotalCost() {
        guard let basket = cart?.basket else { return }
        var result = 0
        basket.forEach { item in
            result += item.price * item.quantity
        }
        cart?.total = result
    }
}
