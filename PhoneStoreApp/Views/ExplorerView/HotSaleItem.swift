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
    
    var body: some View {
        NavigationLink(destination: DetailedView(tabSelection: $tabSelection)) {
            setupHotSaleItem()
        }
    }
    
    func setupHotSaleItem() -> some View {
        return ZStack {
            BackdropImage(url: item.picture, height: height)
            VStack(alignment: .leading) {
                if let isNew = item.isNew,
                   isNew == true {
                    NewIcon(diameter: height * 0.18)
                }
                Title(value: item.title)
                    .frame(width: width / 2, alignment: .leading)
                Subtitle(value: item.subtitle)
                    .frame(width: width / 2, alignment: .leading)
                BuyButton {
                    print("buy")
                }
            }
            .frame(minWidth: .zero, maxWidth: .infinity, minHeight: .zero, maxHeight: .infinity, alignment: .leading)
        }
        .modifier(RoundedCorners(value: K.Values.cornerRadius))
        .padding(.horizontal, 10)
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
                .padding(.horizontal, 20)
                .modifier(LettersWithStroke())
        }
    }

    struct Subtitle: View {
        let value: String
        var body: some View {
            Text(value)
                .font(.body)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 20)
                .modifier(LettersWithStroke())
        }
    }
    
    struct NewIcon: View {
        let diameter: CGFloat
        var textWidth: CGFloat {
            diameter * 0.8
        }
        var body: some View {
            ZStack {
                Circle()
                    .fill(K.Colors.orange)
                    .frame(width: diameter, height: diameter)
                Text("New")
                    .fontWeight(.heavy)
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
                    .frame(width: textWidth)
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 20)
        }
    }
    
    struct BuyButton: View {
        let action: () -> ()
        var body: some View {
            Button {
                action()
            } label: {
                Text("Buy now!")
                    .padding(.horizontal, 25)
                    .padding(.vertical, 5)
            }
            .background(.white)
            .foregroundColor(K.Colors.darkBlue)
            .clipShape(RoundedRectangle(cornerRadius: K.Values.cornerRadius / 2))
            .padding(.horizontal, 20)
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
    
    struct RoundedCorners: ViewModifier {
        let value: CGFloat
        func body(content: Content) -> some View {
            return content
                .cornerRadius(value)
        }
    }
    
    struct LettersWithStroke: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(.white)
                .shadow(color: K.Colors.darkBlue, radius: 0.6)
                .shadow(color: K.Colors.darkBlue, radius: 0.6)
                .shadow(color: K.Colors.darkBlue, radius: 0.6)
        }
    }
    
}
