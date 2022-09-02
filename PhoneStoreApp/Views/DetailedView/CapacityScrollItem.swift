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
                .font(.body)
                .minimumScaleFactor(0.5)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
        }
        .background(K.Colors.orange.opacity(value == selectedCapacity ? 1.0 : 0.0))
        .foregroundColor(value == selectedCapacity ? .white : .secondary)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(height: height)
    }
}

//struct CapacityScrollItem_Previews: PreviewProvider {
//    static var previews: some View {
//        CapacityScrollItem()
//    }
//}
