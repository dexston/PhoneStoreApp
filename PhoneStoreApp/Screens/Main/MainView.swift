//
//  MainView.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import SwiftUI

struct MainView: View {
    
    @State var tabSelection: K.MainViewTabs
    
    @StateObject var viewModel = MainViewModel()
    
    init() {
        tabSelection = .explorer
    }
    
    var body: some View {
        TabView(selection: $tabSelection) {
            ExplorerView(tabSelection: $tabSelection)
                .tabItem {
                    Label("Explorer", systemImage: "xmark")
                }
                .tag(K.MainViewTabs.explorer)
            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
                .badge(5)
                .tag(K.MainViewTabs.cart)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
