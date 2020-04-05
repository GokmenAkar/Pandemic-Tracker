//
//  NewsDetailView.swift
//  Pandemic Tracker
//
//  Created by Developer on 4.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import Foundation
import SwiftUI
import SafariServices
import WebKit

struct SafariView: UIViewRepresentable {
    typealias UIViewType = WKWebView
        
    let url: String

    func makeUIView(context: Context) -> WKWebView {
                let webView = WKWebView()
                webView.load(URLRequest(url: URL(string: url)!))
                return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(url: "ttps://www.sozcu.com.tr/2020/ekonomi/imf-ve-dunya-bankasi-kredileri-dagitilmaya-baslandi-5725418/")
    }
}
