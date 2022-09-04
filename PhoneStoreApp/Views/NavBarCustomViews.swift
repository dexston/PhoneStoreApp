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
    
    let action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
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
