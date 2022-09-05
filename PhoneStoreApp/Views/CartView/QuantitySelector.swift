//
//  QuantitySelector.swift
//  PhoneStoreApp
//
//  Created by Admin on 05.09.2022.
//

import SwiftUI

struct QuantitySelector: View {
    
    let value: Int
     
    var body: some View {
        VStack(spacing: .zero) {
            QuantityButton(type: .minus) {
                print("Minus")
            }
            Text("\(value)")
                .font(.headline)
                .minimumScaleFactor(0.5)
                .foregroundColor(.white)
            QuantityButton(type: .plus) {
                print("Plus")
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(Capsule(style: .circular).fill(.secondary))
    }
}


//struct QuantitySelector_Previews: PreviewProvider {
//    static var previews: some View {
//        QuantitySelector()
//    }
//}

extension QuantitySelector {
    
    enum Sign: String {
        case minus = "-"
        case plus = "+"
    }
    
    struct QuantityButton: View {
        
        let type: Sign
        let action: () -> ()
        
        var body: some View {
            Button {
                action()
            } label: {
                Text(type.rawValue)
                    .font(.headline)
                    .minimumScaleFactor(0.5)
                    //.fontWeight(.semibold)
                    .foregroundColor(.white)
            }
        }
    }
}
