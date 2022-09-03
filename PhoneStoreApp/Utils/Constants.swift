//
//  Constants.swift
//  PhoneStoreApp
//
//  Created by Admin on 30.08.2022.
//

import Foundation
import SwiftUI

struct K {
    
    struct Colors {
        static let darkBlue = Color(uiColor: UIColor(red: 0.00, green: 0.00, blue: 0.21, alpha: 1.00)) //#010035
        static let orange = Color(uiColor: UIColor(red: 1.00, green: 0.43, blue: 0.31, alpha: 1.00))   //#FF6E4E
    }
    
    enum CornerRadius {
        static let navBarButton: CGFloat = 10
        enum HotSaleItem {
            static let backdropImage: CGFloat = 15
            static let buyButton: CGFloat = 8
        }
        enum DetailedView {
            static let infoBlock: CGFloat = 30
            static let likeButton: CGFloat = 10
            static let addToCartButton: CGFloat = 15
            static let capacityScrollItem: CGFloat = 10
            static let specInfoTabLine: CGFloat = 3
        }
        enum ExplorerView {
            static let gridCell: CGFloat = 15
            static let cornerRadius: CGFloat = 15
        }
    }
    
    enum Paddings {
        static let navBarButton: CGFloat = 10
        enum HotSaleItem {
            static let wholeBlock: CGFloat = 10
            static let content: CGFloat = 20
            static let buyButtonText: CGFloat = 5
        }
        enum ExplorerView {
            static let grid: CGFloat = 10
            static let blockTitle: CGFloat = 15
            static let categoryItem: CGFloat = 10
            static let categoriesBlock: CGFloat = 20
            static let gridCellLikeButton: CGFloat = 10
        }
        enum DetailedView {
            static let infoBlock: CGFloat = 20
            static let addToCartButtonText: CGFloat = 15
            static let addToCartButton: CGFloat = 15
            static let capacityScrollItem: CGFloat = 5
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
    }
    
    enum Values {
        static let selectionLines: Int = 1
        static let categoriesLines: Int = 1
        static let gridCols: Int = 2
    }
    
    enum MainViewTabs {
        case explorer
        case cart
    }
}
