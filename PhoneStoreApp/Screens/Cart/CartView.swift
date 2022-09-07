//
//  CartView.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import SwiftUI

struct CartView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var data: Cart?
    
    @StateObject var viewModel = CartViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            let imageFrame = geometry.size.width * 0.2
            VStack {
                CartTitle()
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack {
                    CartContentScrollView(data: data?.basket ?? []) { item in
                        CartContentScrollItem(item: item, imageFrame: imageFrame) { type in
                            viewModel.quantityOperation(type: type, item: item, cart: &data)
                        }
                    }
                    Divider()
                        .background(.white)
                        .padding(.horizontal, K.Paddings.CartView.CartCostInfo.devider)
                    CartCostInfo(total: data?.totalCost ?? 0, delivery: data?.delivery ?? "")
                    Divider()
                        .background(.white)
                        .opacity(0.8)
                        .padding(.horizontal, K.Paddings.CartView.CartCostInfo.devider)
                    CheckoutButton()
                }
                .frame(maxHeight: .infinity)
                .background(Color(K.Colors.darkBlue))
                .cornerRadius(K.CornerRadius.CartView.cartContentScrollView)
                .shadow(color: .secondary.opacity(0.4), radius: 20)
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavBarBackButton(action: dismiss)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavBarAddressButton {
                        print("Address button pressed")
                    }
                }
            }
        }
        
    }
}

//struct CartView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartView()
//    }
//}

extension CartView {
    
    struct CartTitle: View {
        
        let title = "My Cart"
        
        var body: some View {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(Color(K.Colors.darkBlue))
                .padding(K.Paddings.CartView.title)
        }
    }
    
    struct CartCostInfo: View {
        
        let total: Int
        let delivery: String
        
        var body: some View {
            HStack {
                VStack(alignment: .leading, spacing: K.Spacings.CartView.cartCostInfo) {
                    Text("Total")
                        .foregroundColor(.white)
                    Text("Delivery")
                        .foregroundColor(.white)
                }
                Spacer()
                VStack(alignment: .leading, spacing: K.Spacings.CartView.cartCostInfo) {
                    Text("$\(total)")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text(delivery)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal, K.Paddings.CartView.CartCostInfo.horizontal)
            .padding(.vertical, K.Paddings.CartView.CartCostInfo.vertcial)
        }
    }
    
    struct CheckoutButton: View {
        
        let text = "Checkout"
        
        var body: some View {
            Button {
                print("Checkout button pressed")
            } label: {
                Text(text)
                    .fontWeight(.heavy)
                    .minimumScaleFactor(0.8)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, K.Paddings.CartView.checkoutButtonText)
            }
            .background(Color(K.Colors.orange))
            .foregroundColor(.white)
            .cornerRadius(K.CornerRadius.CartView.checkoutButton)
            .frame(maxWidth: .infinity)
            .padding(K.Paddings.CartView.checkoutButton)
        }
    }
}
