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
    
    @Published var cart: Cart?
    
    @Published var bestSellerItems: [Phone] = []
    @Published var hotSaleItems: [HotSale] = []
    
    @Published var filter: Filter
    @Published var categories: [CategoryItem] = []
    private var currentCategory: Int = 1 {
        didSet {
            markCategoryAsSelected()
        }
    }
    

    init() {
        filter = Filter(brand: .samsung, priceRange: .medium, size: .low)
        categories = [
            CategoryItem(id: 1, icon: "iphone", title: "Phones"),
            CategoryItem(id: 2, icon: "desktopcomputer", title: "Computers"),
            CategoryItem(id: 3, icon: "bolt.heart", title: "Health"),
            CategoryItem(id: 4, icon: "books.vertical", title: "Books"),
            CategoryItem(id: 5, icon: "music.note", title: "Music"),
            CategoryItem(id: 6, icon: "gamecontroller", title: "Games")
        ]
        markCategoryAsSelected()
    }
    
    @MainActor func loadContent() async {
        if bestSellerItems.isEmpty ||
           hotSaleItems.isEmpty ||
           cart == nil {
            do {
                let homeStore = try await networkManager.fetchHomeStore()
                let cartInfo = try await networkManager.fetchCartInfo()
                bestSellerItems = homeStore.bestSeller
                hotSaleItems = homeStore.homeStore
                cart = cartInfo
                print("content downloaded")
            } catch {
                print(error)
            }
        }
    }
    
    private func markCategoryAsSelected() {
        categories.indices.forEach { i in
            categories[i].isSelected = categories[i].id == currentCategory
        }
    }
    
    func categorySelected(id: Int) {
        currentCategory = id
    }
    
    func markLiked(item: Phone) {
        for i in bestSellerItems.indices {
            if bestSellerItems[i].id == item.id {
                bestSellerItems[i].isFavorites.toggle()
                break
            }
        }
    }
}

