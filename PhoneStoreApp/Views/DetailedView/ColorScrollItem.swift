//
//  ColorScrollItem.swift
//  PhoneStoreApp
//
//  Created by Admin on 02.09.2022.
//

import SwiftUI

struct ColorScrollItem: View {
    
    var item: String
    var selectedColor: String
    let action: (String) -> ()
    
    var body: some View {
        Button {
            action(item)
        } label: {
            Image(systemName: "checkmark")
                .imageScale(.medium)
                .foregroundColor(.white)
                .opacity(item == selectedColor ? 1.0 : .zero)
                .padding(K.Paddings.DetailedView.colorCircle)
                .background(Circle()
                                .fill(Color(hex: item))
                                .aspectRatio(1, contentMode: .fit))
        }
    }
}

//struct ColorScrollItem_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorScrollItem()
//    }
//}
