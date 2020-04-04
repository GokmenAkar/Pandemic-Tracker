//
//  NewsResponse.swift
//  Pandemic Tracker
//
//  Created by Developer on 4.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import Foundation


struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    var articles: [Article]
    
    static func getExample() -> Article {
        return Article(source: Source(id: "", name: "sozcu.com.tr"), author: "Sözcü", title: "Son dakika… İran’da ölü sayısı 3 bin 452’ye ulaştı", description: "Komşu İran'da corona virüsü nedeniyle hayatını kaybeden hastaların sayısı 3 bin 452'ye yükseldi.", url: "https://www.sozcu.com.tr/2020/dunya/son-dakika-iranda-olu-sayisi-3-bin-452ye-ulasti-5725048/", urlToImage: "https://i.sozcu.com.tr/wp-content/uploads/2018/03/sondakika-20180305-670x371.jpg", publishedAt: "2020-04-04T09:56:50Z", content: "Salk Bakanl yetkilileri ran'da salgnla ilgili son verileri kamuoyuna duyurdu.\r\nSalk Bakanl Sözcüsü Kiyanu Cihanpur’un aktardna göre ülkede son 24 saatte 158 kii daha virüs nedeniyle yaamn yitirdi.\r\nBöylelikle ran'da toplam ölü says 3 bin 452’ye yükseldi. Ülke… [+62 chars]")
    }
}

// MARK: - Article
struct Article: Codable, Hashable {
    
    let source: Source?
    let author, title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case description
        case url, urlToImage, publishedAt, content
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    static func == (lhs: Article, rhs: Article) -> Bool {
        return lhs.title == rhs.title && lhs.source?.name == rhs.source?.name
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}
