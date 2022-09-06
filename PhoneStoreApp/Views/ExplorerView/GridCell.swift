//
//  GridCell.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import SwiftUI

struct GridCell: View {
    
    var item: Phone
    var height: CGFloat
    @Binding var cart: Cart?
    
    let action: (Phone) -> Void
    
    var posterHeight: CGFloat {
        height * 0.7
    }
    var infoHeight: CGFloat {
        height * 0.3
    }
    
    var body: some View {
        NavigationLink(destination: DetailedView(cart: $cart)) {
            VStack(alignment: .leading, spacing: .zero) {
                ZStack {
                    PosterImage(url: item.picture, height: posterHeight)
                    LikeButton(item: item) {
                        action(item)
                    }
                }
                VStack(alignment: .leading, spacing: K.Spacings.ExplorerView.GridCell.infoBlock) {
                    HStack(alignment: .firstTextBaseline) {
                        PriceDiscount(value: item.priceWithoutDiscount)
                        PriceFull(value: item.discountPrice)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    PhoneTitle(value: item.title)
                }
                .padding(.horizontal)
                .frame(height: infoHeight)
                .background(Color(uiColor: .systemBackground))
            }
            .cornerRadius(K.CornerRadius.ExplorerView.gridCell)
            .shadow(color: .secondary.opacity(0.3), radius: 5)
        }
    }
}

extension GridCell {
    
    struct PriceDiscount: View {
        
        let value: Int
        
        var body: some View {
            Text("$\(value)")
                .font(.title2)
                .fontWeight(.bold)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundColor(Color(K.Colors.darkBlue))
        }
    }
    
    struct PriceFull: View {
        
        let value: Int
        
        var body: some View {
            Text("$\(value)")
                .font(.footnote)
                .strikethrough()
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundColor(.secondary)
        }
    }
    
    struct PhoneTitle: View {
        
        let value: String
        
        var body: some View {
            Text(value)
                .font(.footnote)
                .fontWeight(.light)
                .lineLimit(1)
                .minimumScaleFactor(0.3)
                .foregroundColor(Color(K.Colors.darkBlue))
                .frame(maxWidth: .infinity, alignment: .leading)
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
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(uiColor: .systemBackground))
            }
            .frame(minWidth: .zero, maxWidth: .infinity)
            .frame(height: height)
            .clipped()
        }
    }
    
    struct LikeButton: View {
        
        let item: Phone
        let action: () -> Void
        
        var body: some View {
            ZStack {
                Button {
                    action()
                } label: {
                    Image(systemName: item.isFavorites ? "heart.fill" : "heart")
                        .imageScale(.medium)
                        .foregroundColor(Color(K.Colors.orange))
                        .padding(K.Paddings.ExplorerView.gridCellLikeButton)
                        .background(Circle()
                                        .fill(.white)
                                        .shadow(color: .secondary.opacity(0.3), radius: 5))
                }
            }
            .padding([.top, .trailing], K.Paddings.ExplorerView.gridCellLikeButton)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        }
    }
}
