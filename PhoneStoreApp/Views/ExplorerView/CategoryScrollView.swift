//
//  CategoryScrollView.swift
//  PhoneStoreApp
//
//  Created by Admin on 30.08.2022.
//

import SwiftUI

struct CategoryScrollView<Content: View>: View {
    
    let data: [CategoryItem]
    let lines: Int = 1
    let spacing: CGFloat = 20
    let itemViewBuilder: (CategoryItem) -> Content
    
    init(data: [CategoryItem], itemViewBuilder: @escaping (CategoryItem) -> Content) {
        self.data = data
        self.itemViewBuilder = itemViewBuilder
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            self.setupCategories()
                .padding(.horizontal, spacing)
        }
    }
    
    func setupCategories() -> some View {
        
        let rows: [GridItem] = Array(repeating: GridItem(.flexible(), alignment: .leading), count: lines)
        
        return LazyHGrid(rows: rows, alignment: .top) { 
            ForEach(data, id: \.id) { item in
                self.itemViewBuilder(item)
            }
        }
    }
}

//struct CategoryScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryScrollView()
//    }
//}
