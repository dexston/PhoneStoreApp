//
//  DetailsTabView.swift
//  PhoneStoreApp
//
//  Created by Admin on 01.09.2022.
//

import SwiftUI

struct DetailsTabView: View {
    
    @State var tabSelector: DetailsTabType = .shop
    
    let phoneDetails: PhoneDetails
    let height: CGFloat
    
    var tabHeight: CGFloat {
        height * 0.2
    }
    var specInfoHeight: CGFloat {
        height * 0.7
    }
    
    var body: some View {
        VStack {
            HStack {
                DetailsTabTitle(type: .shop, height: tabHeight, tabSelector: $tabSelector)
                DetailsTabTitle(type: .details, height: tabHeight, tabSelector: $tabSelector)
                DetailsTabTitle(type: .features, height: tabHeight, tabSelector: $tabSelector)
            }
            TabView(selection: $tabSelector) {
                SpecInfo(phoneDetails: phoneDetails, height: specInfoHeight)
                    .tag(DetailsTabType.shop)
                Text("There is some details of the phone")
                    .tag(DetailsTabType.details)
                Text("And there is some features")
                    .tag(DetailsTabType.features)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .frame(height: height)
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
        let height: CGFloat
        @Binding var tabSelector: DetailsTabType
        
        var textHeight: CGFloat {
            height * 0.9
        }
        var lineHeight: CGFloat {
            height * 0.1
        }
        
        var body: some View {
            Button {
                tabSelector = type
            } label: {
                VStack(spacing: .zero) {
                    Text("\(type.rawValue.localizedCapitalized)")
                        .foregroundColor(isActive() ? Color(K.Colors.darkBlue) : .secondary)
                        .fontWeight(isActive() ? .bold : .regular)
                        .minimumScaleFactor(0.5)
                        .frame(maxWidth: .infinity)
                        .frame(height: textHeight)
                    RoundedRectangle(cornerRadius: K.CornerRadius.DetailedView.specInfoTabLine)
                        .fill(Color(K.Colors.orange).opacity(isActive() ? 1.0 : .zero))
                        .frame(height: lineHeight)
                        .frame(maxWidth: .infinity)
                }
            }
            .frame(height: height)
        }
        func isActive() -> Bool {
            type == tabSelector
        }
    }
    
    struct SpecInfo: View {
        
        let phoneDetails: PhoneDetails
        let height: CGFloat
        
        var body: some View {
            HStack(alignment: .top, spacing: .zero) {
                SpecItem(icon: "cpu", text: phoneDetails.CPU, height: height)
                SpecItem(icon: "camera", text: phoneDetails.camera, height: height)
                SpecItem(icon: "memorychip", text: phoneDetails.ssd, height: height)
                SpecItem(icon: "sdcard", text: phoneDetails.sd, height: height)
            }
        }
        
        struct SpecItem: View {
            
            let icon: String
            let text: String
            let height: CGFloat
            
            var iconHeight: CGFloat {
                height * 0.3
            }
            var textHeight: CGFloat {
                height * 0.2
            }
            
            var body: some View {
                VStack {
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(height: iconHeight)
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
