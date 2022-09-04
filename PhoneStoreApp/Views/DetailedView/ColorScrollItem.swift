//
//  ColorScrollItem.swift
//  PhoneStoreApp
//
//  Created by Admin on 02.09.2022.
//

import SwiftUI

struct ColorScrollItem: View {
    
    var item: String
    var height: CGFloat
    var selectedColor: String
    let action: (String) -> ()
    
    var iconFrame: CGFloat {
        height * 0.4
    }
    
    var body: some View {
        Button {
            action(item)
        } label: {
            ZStack {
                Circle()
                    .fill(Color(hex: item))
                    .frame(width: height, height: height)
                    .shadow(color: .secondary.opacity(0.3), radius: 5)
                Image(systemName: "checkmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: iconFrame, height: iconFrame)
                    .foregroundColor(.white)
                    .opacity(item == selectedColor ? 1.0 : .zero)
            }
        }
    }
}

//struct ColorScrollItem_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorScrollItem()
//    }
//}
