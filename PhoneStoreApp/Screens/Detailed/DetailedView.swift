//
//  DetailedView.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import SwiftUI

struct DetailedView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var tabSelection: K.Tabs
    
    @StateObject var viewModel = DetailedViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            let frame = geometry.frame(in: .global)
            VStack {
                Spacer()
                setupView(frame: frame)
            }
            .frame(minWidth: .zero, maxWidth: .infinity, minHeight: .zero, maxHeight: .infinity)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavBarBackButton(action: dismiss)
                }
                ToolbarItem(placement: .principal) {
                    Text("Product Details")
                        .foregroundColor(K.Colors.darkBlue)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavBarCartButton {
                        tabSelection = .cart
                    }
                }
            }
            .onAppear {
                Task {
                    await viewModel.loadPhoneDetails()
                }
            }
        }
    }
}

//struct DetailedView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailedView()
//    }
//}

extension DetailedView {
    func setupView(frame: CGRect) -> some View {
        guard let phoneDetails = viewModel.phoneDetails else {
            return AnyView(
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(minWidth: .zero, maxWidth: .infinity, minHeight: .zero, maxHeight: .infinity)
            )
        }
        return AnyView(
            VStack {
                //Spacer()
                HStack {
                    Text(phoneDetails.title)
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(K.Colors.darkBlue)
                    Spacer()
                    LikeButton(isLiked: phoneDetails.isFavorites, height: frame.height * 0.05) {
                        print("Like pressed")
                    }
                }
                .frame(maxWidth: .infinity)
                StarsRating(value: phoneDetails.rating)
                Spacer()
                Button {
                    print("Add to cart")
                } label: {
                    HStack {
                        Text("Add to cart")
                            .fontWeight(.heavy)
                            .frame(maxWidth: .infinity)
                        Text("$\(phoneDetails.price)")
                            .fontWeight(.heavy)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.vertical, 15)
                }
                .background(K.Colors.orange)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(minWidth: .zero, maxWidth: .infinity)

            }
                .frame(minWidth: .zero, maxWidth: frame.width)
                .frame(height: frame.height * 0.5)
                .padding(30)
                .background(.white)
                .modifier(RoundedCornersWithShadow(value: 40))
        )
    }
    
    struct LikeButton: View {
        let isLiked: Bool
        let height: CGFloat
        var iconFrame: CGFloat {
            height * 0.5
        }
        let action: () -> ()
        var body: some View {
            Button {
                action()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(K.Colors.darkBlue)
                        .aspectRatio(1, contentMode: .fill)
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .imageScale(.medium)
                        .foregroundColor(.white)
                        .padding(10)
                }
            }
            .frame(width: height, height: height)
        }
    }
    
    struct StarsRating: View {
        var value: Double
        var body: some View {
            HStack {
                let stars = starCounter()
                ForEach(stars.indices, id: \.self) { i in
                    Image(systemName: stars[i])
                        .foregroundColor(.yellow)
                }
                Spacer()
            }
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
    
    struct RoundedCornersWithShadow: ViewModifier {
        let value: CGFloat
        func body(content: Content) -> some View {
            return content
                .cornerRadius(value)
                .shadow(color: .secondary.opacity(0.4), radius: 10)
        }
    }
}
