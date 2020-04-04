//
//  NewsCell.swift
//  Pandemic Tracker
//
//  Created by Developer on 4.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import SwiftUI

struct NewsCell: View {
    let article: Article
    var body: some View {
        HStack(alignment: .top) {
            NewsImage(imageURL: article.urlToImage ?? "")
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title ?? "").font(.headline)
                Text("Source: \(article.author ?? "")").font(.subheadline).foregroundColor(Color(.darkGray))
                Text("Published: \(article.publishedAt?.convertDateStringToUIFormat() ?? "")").font(.system(size: 10)).foregroundColor(.gray)
            }
        }.padding(4)
    }
}

struct NewsCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsCell(article: NewsResponse.getExample()).previewLayout(.sizeThatFits)
    }
}
