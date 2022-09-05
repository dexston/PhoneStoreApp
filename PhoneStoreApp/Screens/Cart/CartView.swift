//
//  CartView.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import SwiftUI

struct CartView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var viewModel: CartViewModel
    
    var body: some View {
        GeometryReader { geometry in
            let imageFrame = geometry.size.width * 0.2
            VStack {
                CartTitle()
                    .frame(maxWidth: .infinity, alignment: .leading)
                CartContentScrollView(data: viewModel.basket) { basket in
                    CartContentScrollItem(item: basket, imageFrame: imageFrame) {
                        print("Minus")
                    } actionQuantityPlus: {
                        print("Plus")
                    } actionDeleteItem: {
                        print("Delete")
                    }
                }
                .frame(maxHeight: .infinity)
                .background(Color(K.Colors.darkBlue))
                .cornerRadius(30)
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
                .padding(30)
        }
        
    }
    
}
