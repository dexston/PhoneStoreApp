//
//  DetailedView.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import SwiftUI

struct DetailedView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var tabSelection: K.MainViewTabs
    
    @StateObject var viewModel = DetailedViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            let frame = geometry.frame(in: .global)
            let detailsHeight = frame.height * 0.6
            VStack {
                VStack {
                    //There will be images
                }
                .frame(height: frame.height * 0.4)
                setupDetails(height: detailsHeight)
            }
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
    func setupDetails(height: CGFloat) -> some View {
        guard let phoneDetails = viewModel.phoneDetails else {
            return AnyView(
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(minWidth: .zero, maxWidth: .infinity, minHeight: .zero, maxHeight: .infinity)
            )
        }
        let likeButtonHeight = height * 0.1
        let ratingHeight = height * 0.08
        let detailsTabViewHeight = height * 0.35
        let colorCircleHeight = height * 0.1
        let addButtonHeight = height * 0.08
        return AnyView(
            ScrollView(showsIndicators: false) {
                VStack {
                    HStack {
                        DeviceTitle(title: phoneDetails.title)
                        Spacer()
                        LikeButton(isLiked: phoneDetails.isFavorites, height: likeButtonHeight) {
                            print("Like pressed")
                        }
                    }
                    .frame(height: likeButtonHeight)
                    StarsRating(value: phoneDetails.rating, height: ratingHeight)
                    DetailsTabView(phoneDetails: phoneDetails, height: detailsTabViewHeight)
                        .frame(height: detailsTabViewHeight)
                    SelectionTitle()
                    HStack {
                        SelectionScrollView(data: phoneDetails.color) { color in
                            ColorScrollItem(item: color, height: colorCircleHeight, selectedColor: viewModel.selectedColor) { color in
                                viewModel.selectedColor = color
                            }
                        }
                        SelectionScrollView(data: phoneDetails.capacity) { capacity in
                            CapacityScrollItem(value: capacity, height: colorCircleHeight, selectedCapacity: viewModel.selectedCapacity) { capacity in
                                viewModel.selectedCapacity = capacity
                            }
                        }
                    }
                    AddToCartButton(price: phoneDetails.price, height: addButtonHeight)
                }
                .padding(20)
            }
                .background(.white)
                .modifier(RoundedCornersWithShadow(value: 30))
        )
    }
    
    struct DeviceTitle: View {
        let title: String
        var body: some View {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .foregroundColor(K.Colors.darkBlue)
        }
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
                        .frame(width: height, height: height)
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: iconFrame)
                        .foregroundColor(.white)
                }
            }
        }
    }
    
    struct StarsRating: View {
        let value: Double
        let height: CGFloat
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
    
    struct SelectionTitle: View {
        var body: some View {
            HStack {
                Text("Select color and capacity")
                    .font(.body)
                    .minimumScaleFactor(0.5)
                    .foregroundColor(K.Colors.darkBlue)
                Spacer()
            }
        }
    }
    
    struct AddToCartButton: View {
        let price: Int
        let height: CGFloat
        var body: some View {
            Button {
                print("Add to cart")
            } label: {
                HStack {
                    Text("Add to cart")
                        .fontWeight(.heavy)
                        .minimumScaleFactor(0.5)
                        .frame(maxWidth: .infinity)
                    Text("$\(price)")
                        .fontWeight(.heavy)
                        .minimumScaleFactor(0.5)
                        .frame(maxWidth: .infinity)
                }
                .frame(height: height)
                .padding(.vertical, 15)
            }
            .background(K.Colors.orange)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .frame(maxWidth: .infinity)
            .padding(.top, 10)
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
