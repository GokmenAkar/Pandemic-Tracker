//
//  NewsViewModel.swift
//  Pandemic Tracker
//
//  Created by Developer on 4.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject {
    @Published var newsResponse: NewsResponse?
    
    private lazy var service = NetworkService()
    private lazy var newsRequest = NewsRequest()
    
    private var cancellable: AnyCancellable?
     var isLoading: Bool = false
    
    var selectedLanguage: String = "en" {
        didSet {
            newsResponse = nil
            newsRequest.page = 0 
            getNews()
        }
    }
    
    func getNews() {
        if isLoading { return }
        isLoading = true
        
        newsRequest.page += 1
        newsRequest.language = selectedLanguage
        
        cancellable = service
            .baseRequest(request: newsRequest)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { (completion) in
                self.isLoading = false
                switch completion {
                case .finished:
                    print("hehe")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }, receiveValue: { (response) in
                self.isLoading = false
                if self.newsResponse != nil {
                    self.newsResponse?.articles += response.articles
                } else {
                    self.newsResponse = response
                }
            })
    }
}
