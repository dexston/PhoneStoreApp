//
//  HexColorExtension.swift
//  PhoneStoreApp
//
//  Created by Admin on 04.09.2022.
//

import SwiftUI

extension Color {
    init(hex: String, opacity: Double = 1.0) {
        
        var rgb: UInt64 = 0
        Scanner(string: String(hex.dropFirst())).scanHexInt64(&rgb)
        
        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: r, green: g, blue: b, opacity: opacity)
    }
}
