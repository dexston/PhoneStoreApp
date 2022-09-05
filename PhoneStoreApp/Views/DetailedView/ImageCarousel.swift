//
//  ImageCarousel.swift
//  PhoneStoreApp
//
//  Created by Admin on 04.09.2022.
//

import SwiftUI

struct ImageCarousel: View {
    
    let urls: [URL]
    
    init(data: PhoneDetails?) {
        urls = data?.images ?? []
    }
    
    var body: some View {
        TabView {
            ForEach(urls, id: \.self) { url in
                ZStack {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .background(.white)
                            .cornerRadius(K.CornerRadius.DetailedView.imageBlock)
                            .shadow(color: .secondary.opacity(0.4), radius: 10)
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(.circular)
                    }
                }
                .padding(20)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        
    }
}

//struct ImageCarousel_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageCarousel()
//    }
//}
