//
//  HotSaleItem.swift
//  PhoneStoreApp
//
//  Created by Admin on 29.08.2022.
//

import SwiftUI

struct HotSaleItem: View {
    
    let item: HotSale
    let height: CGFloat
    @Binding var cart: Cart?
    
    var body: some View {
        NavigationLink(destination: DetailedView(cart: $cart)) {
            VStack(alignment: .leading) {
                if item.isNew == true {
                    NewIcon()
                }
                VStack(alignment: .leading) {
                    Title(value: item.title)
                    Subtitle(value: item.subtitle)
                }
                .frame(maxHeight: .infinity)
                BuyButton() {
                    print("Buy button pressed")
                }
            }
            .padding(K.Paddings.ExplorerView.HotSaleItem.content)
            .frame(height: height)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(BackdropImage(url: item.picture))
            .cornerRadius(K.CornerRadius.HotSaleItem.backdropImage)
        }
        .padding(.horizontal, K.Paddings.ExplorerView.HotSaleItem.wholeBlock)
    }
}

//struct HotSaleItem_Previews: PreviewProvider {
//    static var previews: some View {
//        HotSaleItem()
//    }
//}

extension HotSaleItem {
    
    struct Title: View {
        
        let value: String
        
        var body: some View {
            Text(value)
                .font(.title)
                .fontWeight(.bold)
                .lineLimit(2)
                .minimumScaleFactor(0.8)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
        }
    }

    struct Subtitle: View {
        
        let value: String
        
        var body: some View {
            Text(value)
                .font(.footnote)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
        }
    }
    
    struct NewIcon: View {
        
        var body: some View {
            
            Text("New")
                .font(.caption)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .minimumScaleFactor(0.5)
                .padding(K.Paddings.ExplorerView.HotSaleItem.newIcon)
                .background(Circle().fill(Color(K.Colors.orange)))
        }
    }
    
    struct BuyButton: View {
        
        let action: () -> ()
        
        var body: some View {
            Button {
                action()
            } label: {
                Text("Buy now!")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(Color(K.Colors.darkBlue))
                    .padding(.vertical, K.Paddings.ExplorerView.HotSaleItem.buyButtonTextHorizontal)
                    .padding(.horizontal, K.Paddings.ExplorerView.HotSaleItem.buyButtonTextVertical)
                    .background(.white)
                    .cornerRadius(K.CornerRadius.HotSaleItem.buyButton)
            }
        }
    }
    
    struct BackdropImage: View {
        
        let url: URL?
        
        var body: some View {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
    }
}
