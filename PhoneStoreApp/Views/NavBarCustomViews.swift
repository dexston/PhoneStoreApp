//
//  NavBarCustomButtons.swift
//  PhoneStoreApp
//
//  Created by Admin on 31.08.2022.
//

import Foundation
import SwiftUI

struct NavBarBackButton: View {
    
    let action: DismissAction
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "chevron.backward")
                .imageScale(.large)
                .foregroundColor(.white)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: K.CornerRadius.navBarButton)
                                .fill(Color(K.Colors.darkBlue))
                                .aspectRatio(1, contentMode: .fit))
        }
    }
}

struct NavBarCartButton: View {
    
    @Binding var cartViewModel: CartViewModel
    
    var body: some View {
        NavigationLink(destination: CartView(viewModel: $cartViewModel)) {
            Image(systemName: "bag")
                .imageScale(.medium)
                .foregroundColor(.white)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: K.CornerRadius.navBarButton)
                                .fill(Color(K.Colors.orange))
                                .aspectRatio(1, contentMode: .fit))
        }
    }
}

struct NavBarAddressButton: View {
    
    let action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Label {
                Text("Add address")
                    .font(.body)
                    .minimumScaleFactor(0.8)
                    .foregroundColor(Color(K.Colors.darkBlue))
            } icon: {
                Image(systemName: "map")
                    .imageScale(.medium)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: K.CornerRadius.navBarButton)
                                    .fill(Color(K.Colors.orange))
                                    .aspectRatio(1, contentMode: .fit))
            }
            .labelStyle(RightSideIcon())
        }
    }
    
    struct RightSideIcon: LabelStyle {
        func makeBody(configuration: Configuration) -> some View {
            HStack {
                configuration.title
                configuration.icon
            }
        }
    }
}
