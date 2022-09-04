//
//  SelectionScrollView.swift
//  PhoneStoreApp
//
//  Created by Admin on 02.09.2022.
//

import SwiftUI

struct SelectionScrollView<Content: View>: View {
    
    let data: [String]
    let itemViewBuilder: (String) -> Content
    
    init(data: [String], itemViewBuilder: @escaping (String) -> Content) {
        self.data = data
        self.itemViewBuilder = itemViewBuilder
    }
    
    var body: some View {
        
        let rows: [GridItem] = Array(repeating: GridItem(.flexible()), count: K.Values.selectionLines)
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, alignment: .center) {
                    ForEach(data, id: \.self) { item in
                        self.itemViewBuilder(item)
                    }
                }
            }
        }
    }
}

//struct ColorScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorScrollView()
//    }
//}
