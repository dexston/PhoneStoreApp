//
//  FiltersView.swift
//  PhoneStoreApp
//
//  Created by Admin on 06.09.2022.
//

import SwiftUI

struct FiltersView: View {
    
    @State var filter: Filter
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    print("X")
                } label: {
                    Image(systemName: "xmark")
                        .imageScale(.medium)
                        .foregroundColor(.white)
                        .padding(K.Paddings.navBarButton)
                        .background(RoundedRectangle(cornerRadius: K.CornerRadius.navBarButton)
                                        .fill(Color(K.Colors.darkBlue))
                                        .aspectRatio(1, contentMode: .fit))
                }
                Spacer()
                Text("Filter options")
                    .foregroundColor(Color(K.Colors.darkBlue))
                Spacer()
                Button {
                    print("Done")
                } label: {
                    Text("Done")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 20)
                        .background(Color(K.Colors.orange))
                        .cornerRadius(K.CornerRadius.navBarButton)
                }
            }
            Picker(selection: $filter.brand) {
                ForEach(Filter.Brand.allCases, id: \.self) { brand in
                    Text(brand.rawValue.capitalized)
                }
            } label: {
                Text("Brand")
            }
            .pickerStyle(.menu)
            Picker(selection: $filter.priceRange) {
                ForEach(Filter.PriceRange.allCases, id: \.self) { price in
                    Text(price.rawValue)
                }
            } label: {
                Text("Price")
            }
            .pickerStyle(.menu)
            Picker(selection: $filter.size) {
                ForEach(Filter.SizeRange.allCases, id: \.self) { size in
                    Text(size.rawValue)
                }
            } label: {
                Text("Size")
            }
            .pickerStyle(.menu)
        }
        .padding(30)
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(30)
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView(filter: Filter(brand: .samsung, priceRange: .low, size: .low))
    }
}
