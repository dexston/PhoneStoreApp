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
            ZStack {
                RoundedRectangle(cornerRadius: K.CornerRadius.navBarButton)
                    .fill(K.Colors.darkBlue)
                    .aspectRatio(1, contentMode: .fill)
                Image(systemName: "chevron.backward")
                    .imageScale(.medium)
                    .foregroundColor(.white)
                    .padding(K.Paddings.navBarButton)
            }
        }
    }
}

struct NavBarCartButton: View {
    
    let action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: K.CornerRadius.navBarButton)
                    .fill(K.Colors.orange)
                    .aspectRatio(1, contentMode: .fill)
                Image(systemName: "bag")
                    .imageScale(.medium)
                    .foregroundColor(.white)
                    .padding(K.Paddings.navBarButton)
            }
        }
    }
}
