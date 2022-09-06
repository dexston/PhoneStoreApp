//
//  ExplorerView.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import SwiftUI

struct ExplorerView: View {
    
    @StateObject var viewModel = ExplorerViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            
            let frame = geometry.frame(in: .global)
            let categoryCircleFrame = frame.width * 0.18
            let hotSalesHeight = frame.width * 0.45
            let bestSellerCellHeight = frame.width * 0.6
            
            NavigationView {
                ZStack {
                    ScrollView {
                        VStack(alignment: .leading, spacing: K.Spacings.ExplorerView.wholeBlock) {
                            BlockLabel(title: "Select category",
                                       extendButton: "view all") {
                                print("View all categories")
                            }
                            setupCategories(height: categoryCircleFrame)
                            //
                            BlockLabel(title: "Hot sales",
                                       extendButton: "see all") {
                                print("See all sales")
                            }
                            setupHotSaleCarousel(height: hotSalesHeight)
                            //
                            BlockLabel(title: "Best seller",
                                       extendButton: "see more") {
                                print("See more best sellers")
                            }
                            setupBestSellerGrid(cellHeight: bestSellerCellHeight)
                        }
                    }
                    //FiltersView(filter: viewModel.filter)
                }
                .edgesIgnoringSafeArea(.bottom)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            print("Filters")
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                                .imageScale(.large)
                                .foregroundColor(Color(K.Colors.darkBlue))
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Label {
                            Text("Hellomoto")
                                .foregroundColor(Color(K.Colors.darkBlue))
                        } icon: {
                            Image(systemName: "map")
                                .foregroundColor(Color(K.Colors.orange))
                        }
                        .labelStyle(.titleAndIcon)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavBarCartButton(setBackground: false, cart: $viewModel.cart)
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
    
    @ViewBuilder func setupCategories(height: CGFloat) -> some View {
        CategoryScrollView(data: viewModel.categories) { category in
            CategoryScrollItem(item: category, height: height) { id in
                viewModel.categorySelected(id: id)
            }
        }
    }
    
    @ViewBuilder func setupHotSaleCarousel(height: CGFloat) -> some View {
        if viewModel.hotSaleItems.isEmpty {
            ProgressView()
                .progressViewStyle(.circular)
                .frame(height: height)
                .frame(maxWidth: .infinity, alignment: .center)
        } else {
            HotSaleSlider(items: viewModel.hotSaleItems) { item in
                HotSaleItem(item: item, height: height, cart: $viewModel.cart)
            }
            .frame(height: height)
        }
    }
    
    @ViewBuilder func setupBestSellerGrid(cellHeight: CGFloat) -> some View {
        if viewModel.bestSellerItems.isEmpty {
            ProgressView()
                .progressViewStyle(.circular)
                .frame(height: cellHeight)
                .frame(maxWidth: .infinity, alignment: .center)
        } else {
            GridView(data: viewModel.bestSellerItems) { phone in
                GridCell(item: phone,
                         height: cellHeight,
                         cart: $viewModel.cart,
                         action: { item in  viewModel.markLiked(item: item)})
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
                    .foregroundColor(Color(K.Colors.darkBlue))
                Spacer()
                Button {
                    action()
                } label: {
                    Text(extendButton)
                        .font(.callout)
                        .foregroundColor(Color(K.Colors.orange))
                }
                
            }
            .padding(.horizontal, K.Paddings.ExplorerView.blockTitle)
        }
    }
}
