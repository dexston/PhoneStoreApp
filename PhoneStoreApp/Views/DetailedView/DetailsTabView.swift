//
//  DetailsTabView.swift
//  PhoneStoreApp
//
//  Created by Admin on 01.09.2022.
//

import SwiftUI

struct DetailsTabView: View {
    
    @State private var tabSelector: DetailsTabType = .shop
    
    let data: PhoneDetails
    
    var body: some View {
        VStack {
            HStack {
                DetailsTabTitle(type: .shop, tabSelector: $tabSelector)
                DetailsTabTitle(type: .details, tabSelector: $tabSelector)
                DetailsTabTitle(type: .features, tabSelector: $tabSelector)
            }
            TabView(selection: $tabSelector) {
                SpecInfo(data: data)
                    .tag(DetailsTabType.shop)
                Text("There is some details of the phone")
                    .tag(DetailsTabType.details)
                Text("And there is some features")
                    .tag(DetailsTabType.features)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

//struct DetailsTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsTabView()
//    }
//}

extension DetailsTabView {
    
    enum DetailsTabType: String {
        case shop
        case details
        case features
    }
    
    struct DetailsTabTitle: View {
        
        let type: DetailsTabType
        @Binding var tabSelector: DetailsTabType
        
        var body: some View {
            Button {
                tabSelector = type
            } label: {
                VStack(spacing: K.Spacings.DetailedView.tabUnderline) {
                    Text("\(type.rawValue.localizedCapitalized)")
                        .foregroundColor(isActive() ? Color(K.Colors.darkBlue) : .secondary)
                        .fontWeight(isActive() ? .bold : .regular)
                        .minimumScaleFactor(0.8)
                    RoundedRectangle(cornerRadius: K.CornerRadius.DetailedView.specInfoTabLine)
                        .fill(Color(K.Colors.orange).opacity(isActive() ? 1.0 : .zero))
                        .frame(height: K.Values.detailsTabUnderline)
                }
                .frame(maxWidth: .infinity)
            }
        }
        func isActive() -> Bool {
            type == tabSelector
        }
    }
    
    struct SpecInfo: View {
        
        let data: PhoneDetails
        
        var body: some View {
            HStack(alignment: .bottom, spacing: .zero) {
                SpecItem(icon: "cpu", text: data.CPU)
                SpecItem(icon: "camera", text: data.camera)
                SpecItem(icon: "memorychip", text: data.ssd)
                SpecItem(icon: "sdcard", text: data.sd)
            }
        }
        
        struct SpecItem: View {
            
            let icon: String
            let text: String
            
            var body: some View {
                VStack {
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.secondary)
                    Text(text)
                        .font(.footnote)
                        .fontWeight(.light)
                        .lineLimit(2)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}
