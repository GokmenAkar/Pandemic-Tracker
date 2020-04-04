//
//  NewsImage.swift
//  Pandemic Tracker
//
//  Created by Developer on 4.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsImage: View {
    let url: URL
    let imageSize: CGSize
    
    let gradient = LinearGradient(gradient: Gradient(colors: [Color(hex: "00a8cc"),Color(hex: "0c7b93"),Color(hex: "27496d")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    init(imageURL: String, imageSize: CGSize? = CGSize(width: 64, height: 64)) {
        self.imageSize = imageSize!
        self.url = URL(string: imageURL == "" ?  "https://egeosgb.com.tr/wp-content/uploads/2016/11/orionthemes-placeholder-image-1.png" : imageURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
    }
    
    var body: some View {
        WebImage(url: url)
            .onSuccess { image, cacheType in
                
        }
        .resizable()
        .placeholder(Image(systemName: "photo"))
        .placeholder {
            Rectangle().foregroundColor(Color(.lightGray))
        }
            .indicator(.activity) // Activity Indicator
            .animation(.easeInOut(duration: 0.5)) // Animation Duration
            .transition(.fade) // Fade Transition
            .aspectRatio(contentMode: .fill)
            .frame(width: imageSize.width, height: imageSize.height, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(gradient, lineWidth: 2))
            .shadow(radius: 8)
            .padding(5)
    }
}

struct NewsImage_Previews: PreviewProvider {
    static var previews: some View {
        NewsImage(imageURL: "https://i.sozcu.com.tr/wp-content/uploads/2018/03/sondakika-20180305-670x371.jpg")
    }
}
