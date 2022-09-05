//
//  DetailedViewExts.swift
//  PhoneStoreApp
//
//  Created by Admin on 05.09.2022.
//

import SwiftUI

extension DetailedView {
    
    struct DeviceTitle: View {
        
        let title: String
        
        var body: some View {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .lineLimit(2)
                .minimumScaleFactor(0.8)
                .foregroundColor(Color(K.Colors.darkBlue))
        }
    }
    
    struct LikeButton: View {
        
        let isLiked: Bool
        let action: () -> ()
        
        var body: some View {
            Button {
                action()
            } label: {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .imageScale(.medium)
                    .foregroundColor(.white)
                    .padding(K.Paddings.DetailedView.likeButton)
                    .background(RoundedRectangle(cornerRadius: K.CornerRadius.DetailedView.likeButton)
                                    .fill(Color(K.Colors.darkBlue))
                                    .aspectRatio(1, contentMode: .fit))
            }
        }
    }
    
    struct StarsRating: View {
        
        let value: Double
        
        var body: some View {
            HStack {
                let stars = starCounter()
                ForEach(stars.indices, id: \.self) { i in
                    Image(systemName: stars[i])
                        .foregroundColor(.yellow)
                }
                Spacer()
            }
            .padding(.bottom, K.Paddings.DetailedView.ratingBottom)
        }
        
        func starCounter() -> [String] {
            var tempValue = value
            var result = Array(repeating: "star.fill", count: Int(tempValue.rounded(.down)))
            tempValue = tempValue - tempValue.rounded(.down)
            switch tempValue - tempValue.rounded(.down) {
            case 0.8..<1.0:
                result.append("star.fill")
            case 0.3..<0.8:
                result.append("star.leadinghalf.filled")
            default:
                result.append("star")
            }
            tempValue = tempValue.rounded(.down)
            if tempValue > 0.0 {
                result.append(contentsOf: Array(repeating: "star", count: Int(tempValue)))
            }
            return result
        }
    }
    
    struct SelectionTitle: View {
        
        var body: some View {
            Text("Select color and capacity")
                .font(.body)
                .minimumScaleFactor(0.8)
                .foregroundColor(Color(K.Colors.darkBlue))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    struct AddToCartButton: View {
        
        let price: Int
        
        var body: some View {
            Button {
                print("Add to cart")
            } label: {
                HStack {
                    Text("Add to cart")
                        .fontWeight(.heavy)
                        .minimumScaleFactor(0.8)
                        .frame(maxWidth: .infinity)
                    Text("$\(price)")
                        .fontWeight(.heavy)
                        .minimumScaleFactor(0.8)
                        .frame(maxWidth: .infinity)
                }
                .padding(.vertical, K.Paddings.DetailedView.addToCartButtonText)
            }
            .background(Color(K.Colors.orange))
            .foregroundColor(.white)
            .cornerRadius(K.CornerRadius.DetailedView.addToCartButton)
            .frame(maxWidth: .infinity)
            .padding(.top, K.Paddings.DetailedView.addToCartButton)
        }
    }
}
