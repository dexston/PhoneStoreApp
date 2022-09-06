//
//  Constants.swift
//  PhoneStoreApp
//
//  Created by Admin on 30.08.2022.
//

import Foundation
import SwiftUI

struct K {
    
    enum Colors {
        static let darkBlue = "DarkBlue" //#010035
        static let orange = "Orange"     //#FF6E4E
    }
    
    enum CornerRadius {
        static let navBarButton: CGFloat = 10
        enum HotSaleItem {
            static let backdropImage: CGFloat = 15
            static let buyButton: CGFloat = 8
        }
        enum DetailedView {
            static let imageBlock: CGFloat = 20
            static let infoBlock: CGFloat = 30
            static let likeButton: CGFloat = 10
            static let addToCartButton: CGFloat = 10
            static let capacityScrollItem: CGFloat = 10
            static let specInfoTabLine: CGFloat = 3
        }
        enum ExplorerView {
            static let gridCell: CGFloat = 15
            static let cornerRadius: CGFloat = 15
        }
        enum CartView {
            static let cartContentScrollItem: CGFloat = 10
            static let cartContentScrollView: CGFloat = 30
            static let checkoutButton: CGFloat = 10
        }
    }
    
    enum Paddings {
        static let navBarButton: CGFloat = 10
        enum ExplorerView {
            static let grid: CGFloat = 10
            static let blockTitle: CGFloat = 15
            static let categoryItem: CGFloat = 10
            static let categoriesBlock: CGFloat = 20
            static let gridCellLikeButton: CGFloat = 10
            enum HotSaleItem {
                static let wholeBlock: CGFloat = 10
                static let content: CGFloat = 20
                static let buyButtonTextHorizontal: CGFloat = 5
                static let buyButtonTextVertical: CGFloat = 25
                static let newIcon: CGFloat = 10
            }
        }
        enum DetailedView {
            static let infoBlock: CGFloat = 20
            static let addToCartButtonText: CGFloat = 15
            static let addToCartButton: CGFloat = 15
            static let colorCircle: CGFloat = 10
            static let likeButton: CGFloat = 10
            static let ratingBottom: CGFloat = 5
            enum CapacityScrollItem {
                static let vertical: CGFloat = 5
                static let horizontal: CGFloat = 10
            }
        }
        enum CartView {
            static let title: CGFloat = 30
            static let cartContentScrollItem: CGFloat = 10
            static let cartContentScrollView: CGFloat = 30
            static let checkoutButtonText: CGFloat = 15
            static let checkoutButton: CGFloat = 30
            enum CartCostInfo {
                static let horizontal: CGFloat = 50
                static let vertcial: CGFloat = 10
                static let devider: CGFloat = 10
            }
            enum QuantityCounter {
                static let horizontal: CGFloat = 10
                static let vertical: CGFloat = 5
            }
        }
    }
    
    enum Spacings {
        enum ExplorerView {
            static let wholeBlock: CGFloat = 10
            static let categoryItem: CGFloat = 20
            enum GridCell {
                static let infoBlock: CGFloat = 5
                static let content: CGFloat = 10
            }
        }
        enum DetailedView {
            static let tabUnderline: CGFloat = 5
        }
        enum CartView {
            static let cartContentScrollItem: CGFloat = 20
            static let cartCostInfo: CGFloat = 20
        }
    }
    
    enum Values {
        static let selectionLines: Int = 1
        static let categoriesLines: Int = 1
        static let gridCols: Int = 2
        static let detailsTabUnderline: CGFloat = 3
    }
    
    enum MainViewTabs {
        case explorer
        case cart
    }
    
    enum QuantityOperationType: String {
        case minus = "-"
        case plus = "+"
        case remove
    }
}
