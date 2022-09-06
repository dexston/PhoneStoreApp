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
                .padding(K.Paddings.navBarButton)
                .background(RoundedRectangle(cornerRadius: K.CornerRadius.navBarButton)
                                .fill(Color(K.Colors.darkBlue))
                                .aspectRatio(1, contentMode: .fit))
        }
    }
}

struct NavBarCartButton: View {
    
    let setBackground: Bool
    
    @Binding var cart: Cart?
    
    var body: some View {
        NavigationLink(destination: CartView(data: $cart)) {
            let quantity = cart?.quantity ?? 0
            Label {
                Text("\(quantity)")
                    .font(.callout)
                    .fontWeight(.light)
                    .foregroundColor(Color(K.Colors.darkBlue))
                    .opacity(quantity > 0 ? 1.0 : .zero)
            } icon: {
                if setBackground {
                    Image(systemName: "bag")
                        .imageScale(.medium)
                        .foregroundColor(.white)
                        .padding(K.Paddings.navBarButton)
                        .background(RoundedRectangle(cornerRadius: K.CornerRadius.navBarButton)
                                        .fill(Color(K.Colors.orange))
                                        .aspectRatio(1, contentMode: .fit))
                } else {
                    Image(systemName: "bag")
                        .imageScale(.large)
                        .foregroundColor(Color(K.Colors.darkBlue))
                }
            }
            .labelStyle(RightSideIcon())
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
                    .font(.callout)
                    .fontWeight(.light)
                    .minimumScaleFactor(0.8)
                    .foregroundColor(Color(K.Colors.darkBlue))
            } icon: {
                Image(systemName: "map")
                    .imageScale(.medium)
                    .foregroundColor(.white)
                    .padding(K.Paddings.navBarButton)
                    .background(RoundedRectangle(cornerRadius: K.CornerRadius.navBarButton)
                                    .fill(Color(K.Colors.orange))
                                    .aspectRatio(1, contentMode: .fit))
            }
            .labelStyle(RightSideIcon())
        }
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
