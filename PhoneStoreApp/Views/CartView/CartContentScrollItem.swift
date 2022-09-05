//
//  CartContentScrollItem.swift
//  PhoneStoreApp
//
//  Created by Admin on 05.09.2022.
//

import SwiftUI

struct CartContentScrollItem: View {
    
    let item: BasketItem
    let imageFrame: CGFloat
    let actionQuantityMinus: () -> ()
    let actionQuantityPlus: () -> ()
    let actionDeleteItem: () -> ()
    
    var body: some View {
        HStack(spacing: 20) {
            ImageItem(url: item.images, frame: imageFrame)
            VStack {
                Title(value: item.title)
                TotalPrice(value: item.price)
            }
            QuantitySelector(value: 5)
            DeleteButton(item: item) {
                print("Delete button pressed")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: imageFrame)
        .padding(.vertical, 10)
    }
}

//struct CartContentScrollItem_Previews: PreviewProvider {
//    static var previews: some View {
//        CartContentScrollItem()
//    }
//}

extension CartContentScrollItem {
    
    struct Title: View {
        
        let value: String
        
        var body: some View {
            VStack {
            Text(value)
                .font(.title2)
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
    }
    
    struct TotalPrice: View {
        
        let value: Int
        
        var body: some View {
            Text("$\(value)")
                .font(.title3)
                .foregroundColor(Color(K.Colors.orange))
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    struct DeleteButton: View {
        
        let item: BasketItem
        let action: () -> ()
        
        var body: some View {
            Button {
                action()
            } label: {
                Image(systemName: "trash")
                    .imageScale(.medium)
                    .foregroundColor(.white)
            }
        }
    }
    
    struct ImageItem: View {
        
        let url: URL
        let frame: CGFloat
        
        var body: some View {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
                    .progressViewStyle(.circular)
            }
            .frame(width: frame, height: frame)
            .clipped()
            .cornerRadius(10)
        }
    }
}
