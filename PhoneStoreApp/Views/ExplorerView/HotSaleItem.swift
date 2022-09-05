//
//  HotSaleItem.swift
//  PhoneStoreApp
//
//  Created by Admin on 29.08.2022.
//

import SwiftUI

struct HotSaleItem: View {
    
    @Binding var tabSelection: K.MainViewTabs
    
    let item: HotSale
    let height: CGFloat
    let width: CGFloat
    
    var newIconHeight: CGFloat {
        height * 0.18
    }
    var buyButtonWidth: CGFloat {
        width * 0.3
    }
    
    var body: some View {
        NavigationLink(destination: DetailedView(tabSelection: $tabSelection)) {
            ZStack {
                BackdropImage(url: item.picture, height: height)
                VStack(alignment: .leading) {
                    if item.isNew == true {
                        NewIcon(height: newIconHeight)
                    }
                    Title(value: item.title)
                    Subtitle(value: item.subtitle)
                    BuyButton(width: buyButtonWidth) {
                        print("Buy button pressed")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding(.leading, K.Paddings.HotSaleItem.content)
            }
            .cornerRadius(K.CornerRadius.HotSaleItem.backdropImage)
            .padding(.horizontal, K.Paddings.HotSaleItem.wholeBlock)
        }
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
                .minimumScaleFactor(0.5)
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
        
        let height: CGFloat
        
        var textWidth: CGFloat {
            height * 0.8
        }
        
        var body: some View {
            ZStack {
                Circle()
                    .fill(Color(K.Colors.orange))
                    .frame(width: height, height: height)
                Text("New")
                    .font(.caption)
                    .fontWeight(.heavy)
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
                    .frame(width: textWidth)
                    .foregroundColor(.white)
            }
        }
    }
    
    struct BuyButton: View {
        
        let width: CGFloat
        let action: () -> ()
        
        var body: some View {
            Button {
                action()
            } label: {
                Text("Buy now!")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .padding(.vertical, K.Paddings.HotSaleItem.buyButtonText)
            }
            .frame(width: width)
            .background(.white)
            .foregroundColor(Color(K.Colors.darkBlue))
            .cornerRadius(K.CornerRadius.HotSaleItem.buyButton)
        }
    }
    
    struct BackdropImage: View {
        
        let url: URL?
        let height: CGFloat
        
        var body: some View {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
                    .progressViewStyle(.circular)
            }
            .frame(minWidth: .zero, maxWidth: .infinity)
            .frame(height: height)
        }
    }
}
