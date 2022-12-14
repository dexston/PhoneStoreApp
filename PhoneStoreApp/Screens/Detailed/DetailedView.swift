//
//  DetailedView.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import SwiftUI

struct DetailedView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var cart: Cart?
    
    @StateObject var viewModel = DetailedViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            let frame = geometry.frame(in: .global)
            VStack(spacing: .zero) {
                ImageCarousel(data: viewModel.phoneDetails)
                    .frame(maxHeight: frame.height * 0.45)
                setupDetails(specsHeight: frame.width * 0.4)
            }
            .edgesIgnoringSafeArea(.bottom)
            .shadow(color: .secondary.opacity(0.4), radius: 10)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavBarBackButton(action: dismiss)
                }
                ToolbarItem(placement: .principal) {
                    Text("Product Details")
                        .foregroundColor(Color(K.Colors.darkBlue))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavBarCartButton(setBackground: true, cart: $cart)
                }
            }
            .task {
                await viewModel.loadPhoneDetails()
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
    
    @ViewBuilder func setupDetails(specsHeight: CGFloat) -> some View {
        if let phoneDetails = viewModel.phoneDetails {
            VStack {
                ScrollView(showsIndicators: false) {
                    HStack {
                        DeviceTitle(title: phoneDetails.title)
                        Spacer()
                        LikeButton(isLiked: phoneDetails.isFavorites) {
                            viewModel.likeToggle()
                        }
                    }
                    StarsRating(value: phoneDetails.rating)
                    DetailsTabView(data: phoneDetails, height: specsHeight)
                    SelectionTitle()
                    HStack {
                        SelectionScrollView(data: phoneDetails.color) { color in
                            ColorScrollItem(item: color,
                                            selectedColor: viewModel.selectedColor,
                                            action: { color in viewModel.selectedColor = color })
                        }
                        SelectionScrollView(data: phoneDetails.capacity) { capacity in
                            CapacityScrollItem(value: capacity,
                                               selectedCapacity: viewModel.selectedCapacity,
                                               action: { capacity in viewModel.selectedCapacity = capacity })
                        }
                    }
                    AddToCartButton(price: phoneDetails.price)
                }
            }
            .padding(K.Paddings.DetailedView.infoBlock)
            .background(.white)
            .cornerRadius(K.CornerRadius.DetailedView.infoBlock)
        }  else {
            ProgressView()
                .progressViewStyle(.circular)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
