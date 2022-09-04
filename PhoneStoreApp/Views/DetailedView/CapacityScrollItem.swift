//
//  CapacityScrollItem.swift
//  PhoneStoreApp
//
//  Created by Admin on 02.09.2022.
//

import SwiftUI

struct CapacityScrollItem: View {
    
    let value: String
    let selectedCapacity: String
    let action: (String) -> ()
    
    var body: some View {
        Button {
            action(value)
        } label: {
            Text(value + " GB")
                .font(.subheadline)
                .minimumScaleFactor(0.8)
                .padding(.horizontal, K.Paddings.DetailedView.CapacityScrollItem.horizontal)
                .padding(.vertical, K.Paddings.DetailedView.CapacityScrollItem.vertical)
        }
        .background(Color(K.Colors.orange).opacity(value == selectedCapacity ? 1.0 : .zero))
        .foregroundColor(value == selectedCapacity ? .white : .secondary)
        .cornerRadius(K.CornerRadius.DetailedView.capacityScrollItem)
    }
}

//struct CapacityScrollItem_Previews: PreviewProvider {
//    static var previews: some View {
//        CapacityScrollItem()
//    }
//}
