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
    
    var body: some View {
        setupCategory()
    }
    
    func setupCategory() -> some View {
        
        return CategoryButton(item: item, height: height) { id in
            action(id)
        }
    }
}

//struct CategoryScrollItem_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryScrollItem()
//    }
//}

extension CategoryScrollItem {
    struct CategoryButton: View {
        let item: CategoryItem
        var height: CGFloat
        var diameter: CGFloat {
            height * 0.9
        }
        var iconFrame: CGFloat {
            diameter * 0.5
        }
        var titleHeight: CGFloat {
            height * 0.1
        }
        let action: (Int) -> ()
        var body: some View {
            Button {
                action(item.id)
            } label: {
                VStack {
                    ZStack {
                        Circle()
                            .fill(item.isSelected ? K.Colors.orange : .white)
                            .frame(width: diameter, height: diameter)
                            .shadow(color: .secondary.opacity(0.3), radius: 5)
                        Image(systemName: item.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: iconFrame, height: iconFrame)
                            .foregroundColor(item.isSelected ? .white : .secondary)
                    }
                    Text(item.title)
                        .font(.footnote)
                        .foregroundColor(item.isSelected ? K.Colors.orange : K.Colors.darkBlue)
                        .frame(height: titleHeight)
                }
                .frame(minWidth: .zero, maxWidth: .infinity, minHeight: .zero, maxHeight: .infinity)
            }
        }
    }
}
