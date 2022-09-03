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
            let categoriesHeight = frame.height * 0.1
            let hotSalesHeight = frame.height * 0.25
            let bestSellerCellHeight = frame.height * 0.4
            
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: K.Spacings.ExplorerView.wholeBlock) {
                        BlockLabel(title: "Select category",
                                   extendButton: "view all") {
                            print("View all categories")
                        }
                        setupCategories(data: viewModel.categories, height: categoriesHeight)
                        //
                        BlockLabel(title: "Hot sales",
                                   extendButton: "see all") {
                            print("See all sales")
                        }
                        setupHotSaleCarousel(height: hotSalesHeight, width: frame.width)
                        //
                        BlockLabel(title: "Best seller",
                                   extendButton: "see more") {
                            print("See more best sellers")
                        }
                        setupBestSellerGrid(data: viewModel.bestSellerItems, cellHeight: bestSellerCellHeight)
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
                .task {
                    await viewModel.loadContent()
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
    
    @ViewBuilder func setupCategories(data: [CategoryItem], height: CGFloat) -> some View {
        CategoryScrollView(data: data) { category in
            CategoryScrollItem(item: category, height: height) { id in
                viewModel.categorySelected(id: id)
            }
        }
    }
    
    @ViewBuilder func setupHotSaleCarousel(height: CGFloat, width: CGFloat) -> some View {
        if viewModel.hotSaleItems.isEmpty {
            ProgressView()
                .progressViewStyle(.circular)
                .frame(width: width, height: height, alignment: .center)
        } else {
            HotSaleSlider(items: viewModel.hotSaleItems) { item in
                HotSaleItem(tabSelection: $tabSelection, item: item, height: height, width: width)
            }
            .frame(width: width, height: height)
        }
    }
    
    @ViewBuilder func setupBestSellerGrid(data: [Phone], cellHeight: CGFloat) -> some View {
        if viewModel.bestSellerItems.isEmpty {
            ProgressView()
                .progressViewStyle(.circular)
                .frame(maxWidth: .infinity, minHeight: cellHeight, maxHeight: .infinity, alignment: .center)
        } else {
            GridView(data: data) { phone in
                GridCell(tabSelection: $tabSelection, item: phone, height: cellHeight)
            }
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
            .padding(.horizontal, K.Paddings.ExplorerView.blockTitle)
        }
    }
}
