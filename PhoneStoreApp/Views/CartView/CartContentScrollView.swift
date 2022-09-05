//
//  CartContentScrollView.swift
//  PhoneStoreApp
//
//  Created by Admin on 05.09.2022.
//

import SwiftUI

struct CartContentScrollView<Content: View>: View {
    
    let data: [BasketItem]
    let itemViewBuilder: (BasketItem) -> Content
    
    init(data: [BasketItem], itemViewBuilder: @escaping (BasketItem) -> Content) {
        self.data = data
        self.itemViewBuilder = itemViewBuilder
    }
    
    var body: some View {
        
        let cols: [GridItem] = Array(repeating: GridItem(.flexible()), count: 1)
        ScrollView {
            LazyVGrid(columns: cols) {
                ForEach(data, id: \.id) { item in
                    itemViewBuilder(item)
                }
            }
        }
        .padding([.horizontal, .top], 30)
    }
}

//struct CartContentScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartContentScrollView()
//    }
//}
