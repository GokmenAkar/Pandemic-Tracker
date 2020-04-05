//
//  NewsView.swift
//  Pandemic Tracker
//
//  Created by Developer on 4.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import SwiftUI

struct NewsView: View {
    @ObservedObject var newsViewModel: NewsViewModel = NewsViewModel()
    
    @State private var showPopup: Bool = false
    
    @State var languages = [Language]()
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            Color.white
            NavigationView {
                if newsViewModel.newsResponse != nil {
                    if !newsViewModel.newsResponse!.articles.isEmpty {
                        List(0...newsViewModel.newsResponse!.articles.count, id: \.self) { index in
                            if index == self.newsViewModel.newsResponse!.articles.count {
                                LoadingCell(vm: self.newsViewModel)
                            } else {
                                NavigationLink(destination:
                                SafariView(url: self.newsViewModel.newsResponse!.articles[index].url!)
                                    .navigationBarTitle("", displayMode: .inline)
                                    .navigationBarHidden(true)) {
                                    NewsCell(article: self.newsViewModel.newsResponse!.articles[index])
                                }
                                    .navigationBarTitle("News")
                                    .navigationBarItems(trailing: Button("Source Country") {
                                        self.showPopup.toggle()
                                    }
                                    .foregroundColor(Color(hex: "00a8cc"))
                                )
                            }
                        }
                    } else {
                        Text("There is no news :(")
                            .frame(maxWidth: .infinity, maxHeight: 120)
                            .navigationBarTitle("News")
                            .navigationBarItems(trailing: Button("Source Language") {
                                self.showPopup.toggle()
                            }
                            .foregroundColor(Color(hex: "00a8cc"))
                        )

                    }
                } else {
                    Text("Loading...")
                        .frame(maxWidth: .infinity, maxHeight: 120)
                        .navigationBarTitle("News")
                        .navigationBarItems(trailing: Button("Source Language") {
                            self.showPopup.toggle()
                        }
                        .foregroundColor(Color(hex: "00a8cc"))
                    )
                }
                
            }
           
            if showPopup {
                LanguageView(languages: self.languages, selectedLanguage: $newsViewModel.selectedLanguage, isSelected: $showPopup)
                    .offset(x: -8, y: 60)
            }
        }
        .onAppear {
            self.newsViewModel.getNews()
            self.languages = languagesArray
                .map { Language(acronym: $0.key, name: $0.value) }
                .sorted { $0.acronym < $1.acronym }
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
