//
//  HotSaleSlider.swift
//  PhoneStoreApp
//
//  Created by Admin on 29.08.2022.
//

import SwiftUI

struct HotSaleSlider<Content: View>: View {
    
    let items: [HotSale]
    
    let itemViewBuilder: (HotSale) -> Content
    
    var body: some View {
        TabView {
            ForEach(items, id: \.self) { item in
                self.itemViewBuilder(item)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

//struct HotSaleSlider_Previews: PreviewProvider {
//    static var previews: some View {
//        HotSaleSlider()
//    }
//}
