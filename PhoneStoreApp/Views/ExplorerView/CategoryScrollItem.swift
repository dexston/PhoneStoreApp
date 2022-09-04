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
    
    var circleFrame: CGFloat {
        height * 0.9
    }
    var iconFrame: CGFloat {
        circleFrame * 0.5
    }
    var titleHeight: CGFloat {
        height * 0.1
    }
    
    var body: some View {
        Button {
            action(item.id)
        } label: {
            VStack {
                ZStack {
                    Circle()
                        .fill(item.isSelected ? Color(K.Colors.orange) : .white)
                        .frame(width: circleFrame, height: circleFrame)
                        .shadow(color: .secondary.opacity(0.3), radius: 5)
                    Image(systemName: item.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: iconFrame, height: iconFrame)
                        .foregroundColor(item.isSelected ? .white : .secondary)
                }
                Text(item.title)
                    .font(.footnote)
                    .foregroundColor(item.isSelected ? Color(K.Colors.orange) : Color(K.Colors.darkBlue))
                    .frame(height: titleHeight)
            }
        }
        .padding(.vertical, K.Paddings.ExplorerView.categoryItem)
    }
}

//struct CategoryScrollItem_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryScrollItem()
//    }
//}
