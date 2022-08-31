//
//  MainView.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ExplorerView()
                .tabItem {
                    Label("Explorer", systemImage: "xmark")
                }
            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
