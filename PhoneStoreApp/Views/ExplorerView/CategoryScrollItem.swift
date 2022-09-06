//
//  CategoryScrollItem.swift
//  PhoneStoreApp
//
//  Created by Admin on 30.08.2022.
//

import SwiftUI

struct CategoryScrollItem: View {
    
    var item: CategoryItem
    var height: CGFloat
    let action: (Int) -> ()
    
    var iconFrame: CGFloat {
        height * 0.5
    }
    
    var body: some View {
        Button {
            action(item.id)
        } label: {
            Label {
                Text(item.title)
                    .font(.footnote)
                    .foregroundColor(item.isSelected ? Color(K.Colors.orange) : Color(K.Colors.darkBlue))
            } icon: {
                ZStack {
                    Circle()
                        .fill(item.isSelected ? Color(K.Colors.orange) : .white)
                        .frame(width: height, height: height)
                        .shadow(color: .secondary.opacity(0.3), radius: 5)
                    Image(systemName: item.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: iconFrame, height: iconFrame)
                        .foregroundColor(item.isSelected ? .white : .secondary)
                }
            }
            .labelStyle(TitleUnderIcon())
        }
        .padding(.vertical, K.Paddings.ExplorerView.categoryItem)
    }
    
    struct TitleUnderIcon: LabelStyle {
        func makeBody(configuration: Configuration) -> some View {
            VStack {
                configuration.icon
                configuration.title
            }
        }
    }
}

//struct CategoryScrollItem_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryScrollItem()
//    }
//}
