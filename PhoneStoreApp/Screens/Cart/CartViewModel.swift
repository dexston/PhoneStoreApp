//
//  CartViewModel.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import Foundation
import SwiftUI

class CartViewModel: ObservableObject {
    
    func quantityOperation(type: K.QuantityOperationType, item: BasketItem, cart: inout Cart?) {
        guard var basket = cart?.basket else { return }
    finding: for i in basket.indices {
            if basket[i].id == item.id {
                switch type {
                case .minus:
                    if basket[i].quantity == 1 {
                        basket.remove(at: i)
                        break finding
                    } else {
                        basket[i].quantity -= 1
                        break finding
                    }
                case .plus:
                    basket[i].quantity += 1
                    break finding
                case .remove:
                    basket.remove(at: i)
                    break finding
                }
            }
        }
        cart?.basket = basket
    }
    
}
