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

struct SafariView: UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController
    
    let url: String
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(url: "ttps://www.sozcu.com.tr/2020/ekonomi/imf-ve-dunya-bankasi-kredileri-dagitilmaya-baslandi-5725418/")
    }
}
