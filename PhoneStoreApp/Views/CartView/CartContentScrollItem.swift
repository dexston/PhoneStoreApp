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
    let action: (K.QuantityOperationType) -> Void
    
    var body: some View {
        HStack(spacing: K.Spacings.CartView.cartContentScrollItem) {
            ImageItem(url: item.images, frame: imageFrame)
            VStack {
                Title(value: item.title)
                TotalPrice(value: item.price * item.quantity)
            }
            QuantitySelector(item: item, action: action)
            DeleteButton(item: item, action: action)
        }
        .frame(maxWidth: .infinity, maxHeight: imageFrame)
        .padding(.vertical, K.Paddings.CartView.cartContentScrollItem)
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
        let action: (K.QuantityOperationType) -> ()
        
        var body: some View {
            Button {
                action(.remove)
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
            .cornerRadius(K.CornerRadius.CartView.cartContentScrollItem)
        }
    }
}
