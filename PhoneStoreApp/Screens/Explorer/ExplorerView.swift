//
//  ExplorerView.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import SwiftUI

struct ExplorerView: View {
    
    @Binding var tabSelection: K.MainViewTabs
    @StateObject var viewModel = ExplorerViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            let frame = geometry.frame(in: .global)
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        BlockLabel(title: "Select category",
                                   extendButton: "view all") {
                            print("View all categories")
                        }
                        setupCategories(data: viewModel.categories, height: frame.height * 0.1)
                        //
                        BlockLabel(title: "Hot sales",
                                   extendButton: "see all") {
                            print("See all sales")
                        }
                        setupHotSaleCarousel(height: frame.height * 0.25, width: frame.width)
                        //
                        BlockLabel(title: "Best seller",
                                   extendButton: "see more") {
                            print("See more best sellers")
                        }
                        setupBestSellerGrid(data: viewModel.bestSellerItems, cellHeight: frame.height * 0.33)
                        //
                        Spacer()
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Label {
                            Text("Hellomoto")
                                .foregroundColor(K.Colors.darkBlue)
                        } icon: {
                            Image(systemName: "map")
                                .foregroundColor(K.Colors.orange)
                        }
                        .labelStyle(.titleAndIcon)
                        
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            print("Filter pressed")
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                                .imageScale(.large)
                                .foregroundColor(K.Colors.darkBlue)
                        }
                    }
                }
                .onAppear {
                    Task {
                        await viewModel.loadContent()
                    }
                }
            }
            .navigationViewStyle(.stack)
        }
    }
}

//struct ExplorerView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExplorerView()
//    }
//}

extension ExplorerView {
    
    func setupCategories(data: [CategoryItem], height: CGFloat) -> some View {
        return CategoryScrollView(data: data) { category in
            CategoryScrollItem(item: category, height: height) { id in
                viewModel.categorySelected(id: id)
            }
        }
    }
    
    func setupHotSaleCarousel(height: CGFloat, width: CGFloat) -> some View {
        if viewModel.hotSaleItems.isEmpty {
            return AnyView (
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(width: width, height: height, alignment: .center)
            )
        } else {
            return AnyView (
                HotSaleSlider(items: viewModel.hotSaleItems) { item in
                    HotSaleItem(tabSelection: $tabSelection, item: item, height: height, width: width)
                }
                    .frame(width: width, height: height)
            )
        }
    }
    
    func setupBestSellerGrid(data: [Phone], cellHeight: CGFloat) -> some View {
        if viewModel.bestSellerItems.isEmpty {
            return AnyView (
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(maxWidth: .infinity, minHeight: cellHeight, maxHeight: .infinity, alignment: .center)
                    .padding(20)
            )
        } else {
            return AnyView (
                GridView(data: data) { phone in
                    GridCell(tabSelection: $tabSelection, item: phone, height: cellHeight)
                }
            )
        }
    }
    
    struct BlockLabel: View {
        
        var title: String
        var extendButton: String
        var action: () -> ()
        
        var body: some View {
            HStack(alignment: .center) {
                Text(title)
                    .font(.title)
                    .foregroundColor(K.Colors.darkBlue)
                Spacer()
                Button {
                    action()
                } label: {
                    Text(extendButton)
                        .font(.callout)
                        .foregroundColor(K.Colors.orange)
                }
            }
            .padding(.leading, 15)
            .padding(.trailing, 20)
        }
    }
}
