//
//  GridView.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import SwiftUI

struct GridView<Content: View>: View {
    
    let data: [Phone]
    let cellViewBuilder: (Phone) -> Content
    
    init(data: [Phone], cellViewBuilder: @escaping (Phone) -> Content) {
        self.data = data
        self.cellViewBuilder = cellViewBuilder
    }
    
    var body: some View {
        
        let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: K.Spacings.ExplorerView.GridCell.content),
                                        count: K.Values.gridCols)
        
        LazyVGrid(columns: columns, alignment: .leading, spacing: K.Spacings.ExplorerView.GridCell.content) {
            ForEach(data, id: \.id) { item in
                self.cellViewBuilder(item)
            }
        }
        .padding(.horizontal, K.Paddings.ExplorerView.grid)
    }
}

