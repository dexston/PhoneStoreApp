//
//  MainViewModel.swift
//  PhoneStoreApp
//
//  Created by Admin on 27.08.2022.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published var tabSelection: K.MainViewTabs = .explorer
}
