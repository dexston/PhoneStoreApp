//
//  ExplorerViewModel.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import Foundation
import SwiftUI

class ExplorerViewModel: ObservableObject {
    
    private let networkManager = NetworkManager()
    
    @Published var bestSellerItems: [Phone] = []
    @Published var hotSaleItems: [HotSale] = []
    
    @Published var categories: [CategoryItem] = []
    @Published var currentCategory: Int = 0 {
        didSet {
            markCategoryAsSelected()
        }
    }

    init() {
        networkManager.delegate = self
        categories = [
            CategoryItem(id: 1, icon: "iphone", title: "Phones"),
            CategoryItem(id: 2, icon: "desktopcomputer", title: "Computers"),
            CategoryItem(id: 3, icon: "bolt.heart", title: "Health"),
            CategoryItem(id: 4, icon: "books.vertical", title: "Books"),
            CategoryItem(id: 5, icon: "music.note", title: "Music"),
            CategoryItem(id: 6, icon: "gamecontroller", title: "Games")
        ]
        currentCategory = 1
    }
    
    func loadContent() async {
        await networkManager.fetchHomeStore()
    }
    
    func markCategoryAsSelected() {
        categories.indices.forEach { i in
            categories[i].isSelected = categories[i].id == currentCategory
        }
    }
    
    func categorySelected(id: Int) {
        currentCategory = id
    }
    
}

extension ExplorerViewModel: NetworkManagerDelegate {
    func didBestSellerUpdate(data: [Phone]) {
        bestSellerItems = data
    }
    
    func didHotSalesUpdate(data: [HotSale]) {
        hotSaleItems = data
    }
    
    func didFailWithError(error: Error) {
        print(error.localizedDescription)
    }
    
    
}