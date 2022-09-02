//
//  GridView.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import SwiftUI

struct GridView<Content: View>: View {
    
    let data: [Phone]
    let cols: Int = 2
    let spacing: CGFloat = 10
    let cellViewBuilder: (Phone) -> Content
    
    init(data: [Phone], cellViewBuilder: @escaping (Phone) -> Content) {
        self.data = data
        self.cellViewBuilder = cellViewBuilder
    }
    
    var body: some View {
        
        self.setupView().padding(.horizontal, spacing)
    
        if data.isEmpty {
            Text("No movies")
        }
    }
    
    private func setupView() -> some View {
        
        let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: spacing), count: cols)
        
        return LazyVGrid(columns: columns, alignment: .leading, spacing: spacing) {
            ForEach(data, id: \.id) { item in
                self.cellViewBuilder(item)
            }
        }
    }
}

