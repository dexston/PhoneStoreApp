//
//  QuantitySelector.swift
//  PhoneStoreApp
//
//  Created by Admin on 05.09.2022.
//

import SwiftUI

struct QuantitySelector: View {
    
    let item: BasketItem
    let action: (K.QuantityOperationType) -> Void
     
    var body: some View {
        VStack(spacing: .zero) {
            QuantityButton(type: .minus) { type in
                action(type)
            }
            Text("\(item.quantity)")
                .font(.headline)
                .minimumScaleFactor(0.5)
                .foregroundColor(.white)
            QuantityButton(type: .plus) { type in
                action(type)
            }
        }
        .padding(.horizontal, K.Paddings.CartView.QuantityCounter.horizontal)
        .padding(.vertical, K.Paddings.CartView.QuantityCounter.vertical)
        .background(Capsule(style: .circular).fill(.secondary))
    }
}


//struct QuantitySelector_Previews: PreviewProvider {
//    static var previews: some View {
//        QuantitySelector()
//    }
//}

extension QuantitySelector {
    
    struct QuantityButton: View {
        
        let type: K.QuantityOperationType
        let action: (K.QuantityOperationType) -> Void
        
        var body: some View {
            Button {
                action(type)
            } label: {
                Text(type.rawValue)
                    .font(.headline)
                    .minimumScaleFactor(0.5)
                    .foregroundColor(.white)
            }
        }
    }
}
