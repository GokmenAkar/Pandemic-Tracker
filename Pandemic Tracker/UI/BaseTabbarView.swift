//
//  BaseTabbarView.swift
//  Pandemic Tracker
//
//  Created by Developer on 3.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import SwiftUI
import MapKit

struct BaseTabbarView: View {
    @State private var selection: Int = 0
//    let gradient = LinearGradient(gradient: Gradient(colors: [,Color(hex: "0c7b93"),Color(hex: "27496d")]), startPoint: .topLeading, endPoint: .bottomTrailing)

    var body: some View {
        TabView(selection: $selection) {
            MainView()
                .tabItem {
                    VStack {
                        Image(systemName: "globe")
                        Text("Global")
                    }
            }
                .tag(0)
            
            NewsView()
                .tabItem {
                VStack {
                    Image(systemName: "n.circle")
                    Text("News")
                }
            }
            .tag(1)
        }
        .accentColor(Color(hex: "00a8cc"))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BaseTabbarView()
    }
}
