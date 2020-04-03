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
    var body: some View {
        TabView(selection: $selection) {
            MainView()
                .tabItem {
                    VStack {
                        Image(systemName: "map")
                        Text("Global")
                    }
                }
                .tag(0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BaseTabbarView()
    }
}
