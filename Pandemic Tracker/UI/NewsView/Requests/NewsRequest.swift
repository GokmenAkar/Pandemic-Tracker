//
//  NewsRequest.swift
//  Pandemic Tracker
//
//  Created by Developer on 4.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import Foundation

class NewsRequest: BaseAPIRequest<NewsResponse> {
    var page: Int = 0
    var language: String = "en"
    
    override var baseURL: String {
        return "https://newsapi.org/"
    }
    
    override var apiVersion: String {
        return "v2/"
    }
    
    override var endPoint: EndPoints {
        return .everything
    }
    
    override var queryItems: [URLQueryItem] {
        return [
            URLQueryItem(name: "q", value: "corona"),
            URLQueryItem(name: "language", value: language.localizedLowercase),
            URLQueryItem(name: "from", value: "2020-03-16"),
            URLQueryItem(name: "sortBy", value: "publishedAt"),
            URLQueryItem(name: "apiKey", value: "38f8a5faecaf437e9a22f2fc12631ec5"),
            URLQueryItem(name: "pageSize", value: "20"),
            URLQueryItem(name: "page", value: "\(page)")
        ]
    }
}
