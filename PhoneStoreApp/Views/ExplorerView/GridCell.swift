//
//  GridCell.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import SwiftUI

struct GridCell: View {
    
    @Binding var tabSelection: K.MainViewTabs
    
    var item: Phone
    var height: CGFloat
    
    var posterHeight: CGFloat {
        height * 0.7
    }
    var infoHeight: CGFloat {
        height * 0.3
    }
    
    var body: some View {
        NavigationLink(destination: DetailedView(tabSelection: $tabSelection)) {
            setupCell()
        }
    }
    
    private func setupCell() -> some View {
        return VStack(alignment: .leading, spacing: 0) {
            ZStack {
                PosterImage(url: item.picture, height: posterHeight)
                LikeButton(item: item, diameter: height * 0.12) {
                    print("Like pressed")
                }
            }
            VStack(alignment: .leading, spacing: 5) {
                HStack(alignment: .firstTextBaseline) {
                    PriceDiscount(value: item.priceWithoutDiscount)
                    PriceFull(value: item.discountPrice)
                }
                PhoneTitle(value: item.title)
            }
            .padding(10)
            .frame(height: infoHeight)
            .frame(minWidth: .zero, maxWidth: .infinity, alignment: .leading)
            .background(Color(uiColor: .systemBackground))
        }
        .modifier(RoundedCornersWithShadow(value: K.Values.cornerRadius))
    }
}

extension GridCell {
    
    struct PriceDiscount: View {
        let value: Int
        var body: some View {
            Text("$\(value)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(K.Colors.darkBlue)
        }
    }
    
    struct PriceFull: View {
        let value: Int
        var body: some View {
            Text("$\(value)")
                .font(.footnote)
                .strikethrough()
                .foregroundColor(.secondary)
        }
    }
    
    struct PhoneTitle: View {
        let value: String
        var body: some View {
            Text(value)
                .font(.footnote)
                .foregroundColor(K.Colors.darkBlue)
        }
    }
    
    struct PosterImage: View {
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
                    .frame(minWidth: .zero, maxWidth: .infinity, minHeight: .zero, maxHeight: .infinity)
                    .background(Color(uiColor: .systemBackground))
            }
            .frame(minWidth: .zero, maxWidth: .infinity)
            .frame(height: height)
            .clipped()
        }
    }
    
    struct LikeButton: View {
        let item: Phone
        let diameter: CGFloat
        var iconFrame: CGFloat {
            diameter * 0.5
        }
        let action: () -> ()
        var body: some View {
            Button {
                action()
            } label: {
                ZStack {
                    Circle()
                        .fill(.white)
                        .frame(width: diameter, height: diameter)
                        .shadow(color: .secondary.opacity(0.3), radius: 5)
                    Image(systemName: item.isFavorites ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: iconFrame, height: iconFrame)
                        .foregroundColor(K.Colors.orange)
                }
            }
            .frame(minWidth: .zero, maxWidth: .infinity, minHeight: .zero, maxHeight: .infinity, alignment: .topTrailing)
            .padding([.top, .trailing], K.Values.cornerRadius / 2)
        }
    }

    struct RoundedCornersWithShadow: ViewModifier {
        let value: CGFloat
        func body(content: Content) -> some View {
            return content
                .cornerRadius(value)
                .shadow(color: .secondary.opacity(0.3), radius: 5)
        }
    }
}
