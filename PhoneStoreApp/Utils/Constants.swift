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
        static let darkBlue = Color(uiColor: UIColor(red: 0.00, green: 0.00, blue: 0.21, alpha: 1.00))
        static let orange = Color(uiColor: UIColor(red: 1.00, green: 0.43, blue: 0.31, alpha: 1.00))
    }
    
    struct Values {
        static let cornerRadius: CGFloat = 15
    }
    
    enum Tabs {
        case explorer
        case cart
    }
    
}
