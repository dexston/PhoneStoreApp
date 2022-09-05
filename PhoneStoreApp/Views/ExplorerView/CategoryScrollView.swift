//
//  CategoryScrollView.swift
//  PhoneStoreApp
//
//  Created by Admin on 30.08.2022.
//

import SwiftUI

struct CategoryScrollView<Content: View>: View {
    
    let data: [CategoryItem]
    let itemViewBuilder: (CategoryItem) -> Content
    
    init(data: [CategoryItem], itemViewBuilder: @escaping (CategoryItem) -> Content) {
        self.data = data
        self.itemViewBuilder = itemViewBuilder
    }
    
    var body: some View {
        
        let rows: [GridItem] = Array(repeating: GridItem(.flexible(), alignment: .leading),
                                     count: K.Values.categoriesLines)
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, alignment: .top, spacing: K.Spacings.ExplorerView.categoryItem) {
                ForEach(data, id: \.id) { item in
                    itemViewBuilder(item)
                }
            }
            .padding(.horizontal, K.Paddings.ExplorerView.categoriesBlock)
        }
    }
}

//struct CategoryScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryScrollView()
//    }
//}
