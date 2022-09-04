//
//  CapacityScrollItem.swift
//  PhoneStoreApp
//
//  Created by Admin on 02.09.2022.
//

import SwiftUI

struct CapacityScrollItem: View {
    
    let value: String
    let height: CGFloat
    let selectedCapacity: String
    let action: (String) -> ()
    
    var body: some View {
        Button {
            action(value)
        } label: {
            Text(value + " GB")
                .font(.subheadline)
                .minimumScaleFactor(0.5)
                .padding(.horizontal)
                .padding(.vertical, K.Paddings.DetailedView.capacityScrollItem)
        }
        .background(Color(K.Colors.orange).opacity(value == selectedCapacity ? 1.0 : .zero))
        .foregroundColor(value == selectedCapacity ? .white : .secondary)
        .cornerRadius(K.CornerRadius.DetailedView.capacityScrollItem)
        .frame(height: height)
    }
}

//struct CapacityScrollItem_Previews: PreviewProvider {
//    static var previews: some View {
//        CapacityScrollItem()
//    }
//}
