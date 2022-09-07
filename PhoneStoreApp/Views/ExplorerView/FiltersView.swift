//
//  FiltersView.swift
//  PhoneStoreApp
//
//  Created by Admin on 06.09.2022.
//

import SwiftUI

struct FiltersView: View {
    
    @Binding var filter: Filter
    
    let actionClose: () -> Void
    let actionDone: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                HStack {
                    ButtonClose {
                        actionClose()
                    }
                    Spacer()
                    ButtonDone {
                        actionDone()
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                Text("Filter options")
                    .foregroundColor(Color(K.Colors.darkBlue))
            }
            .padding(.bottom, K.Paddings.ExplorerView.filterElements)
            BrandPicker(title: "Brand", filter: $filter.brand)
            PricePicker(title: "Price", filter: $filter.priceRange)
            SizePicker(title: "Size", filter: $filter.size)
        }
        .padding(K.Paddings.ExplorerView.filterElements)
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(K.CornerRadius.ExplorerView.filter)
        .shadow(color: .secondary.opacity(0.4), radius: 10)
    }
}

//struct FiltersView_Previews: PreviewProvider {
//    static var previews: some View {
//        FiltersView())
//    }
//}

extension FiltersView {
    
    struct ButtonDone: View {
        
        let action: () -> ()
        
        var body: some View {
            Button {
                action()
            } label: {
                Text("Done")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal, K.Paddings.ExplorerView.filterDoneButton)
                    .frame(maxHeight: .infinity)
                    .background(Color(K.Colors.orange).scaledToFill())
                    .cornerRadius(K.CornerRadius.navBarButton)
            }
        }
    }
    
    struct ButtonClose: View {
        
        let action: () -> ()
        
        var body: some View {
            Button {
                action()
            } label: {
                Image(systemName: "xmark")
                    .imageScale(.medium)
                    .foregroundColor(.white)
                    .padding(K.Paddings.navBarButton)
                    .background(RoundedRectangle(cornerRadius: K.CornerRadius.navBarButton)
                                    .fill(Color(K.Colors.darkBlue))
                                    .aspectRatio(1, contentMode: .fit))
            }
        }
    }
    
    struct BrandPicker: View {
        
        let title: String
        @Binding var filter: Filter.Brand
        
        var body: some View {
            VStack(alignment: .leading, spacing: K.Spacings.ExplorerView.filterPicker) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(Color(K.Colors.darkBlue))
                Menu {
                    Picker(title, selection: $filter) {
                        ForEach(type(of: filter).allCases, id: \.self) { item in
                            Text(item.rawValue)
                        }
                    }
                } label: {
                    Text(filter.rawValue)
                        .foregroundColor(Color(K.Colors.darkBlue))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(K.Paddings.ExplorerView.filterPicker)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.secondary, lineWidth: 0.5))
                }
            }
            .padding(.bottom, K.Paddings.ExplorerView.filterPicker)
        }
    }
    
    struct PricePicker: View {
        
        let title: String
        @Binding var filter: Filter.PriceRange
        
        var body: some View {
            VStack(alignment: .leading, spacing: K.Spacings.ExplorerView.filterPicker) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(Color(K.Colors.darkBlue))
                Menu {
                Picker(title, selection: $filter) {
                    ForEach(type(of: filter).allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }
            } label: {
                Text(filter.rawValue)
                    .foregroundColor(Color(K.Colors.darkBlue))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(K.Paddings.ExplorerView.filterPicker)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.secondary, lineWidth: 0.5))
            }
            }
            .padding(.bottom, K.Paddings.ExplorerView.filterPicker)
        }
    }
    
    struct SizePicker: View {
        
        let title: String
        @Binding var filter: Filter.SizeRange
        
        var body: some View {
            VStack(alignment: .leading, spacing: K.Spacings.ExplorerView.filterPicker) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(Color(K.Colors.darkBlue))
                Menu {
                Picker(title, selection: $filter) {
                    ForEach(type(of: filter).allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }
            } label: {
                Text(filter.rawValue)
                    .foregroundColor(Color(K.Colors.darkBlue))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(K.Paddings.ExplorerView.filterPicker)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.secondary, lineWidth: 0.5))
            }
            }
            .padding(.bottom, K.Paddings.ExplorerView.filterPicker)
        }
    }
}
