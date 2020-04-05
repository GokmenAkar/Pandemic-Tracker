//
//  LoadingCell.swift
//  Pandemic Tracker
//
//  Created by Developer on 4.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import SwiftUI

struct LoadingCell: View {
    @ObservedObject var vm: NewsViewModel
    @State var degree: Double = 0.0
    @State var scale: CGFloat = 1
    
    var body: some View {
        let linearGradient = LinearGradient(gradient: Gradient(colors: [Color(hex: "00a8cc"),Color(hex: "0c7b93"),Color(hex: "27496d")]), startPoint: .topLeading, endPoint: .bottomTrailing)
        
        return
            VStack {
                Circle()
                    .trim(from: 0.2, to: 1.0)
                    .stroke(linearGradient, lineWidth: 4)
                    .frame(height: 40)
                    .padding()
                    .rotationEffect(.degrees(degree))
                    .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))

                    .scaleEffect(scale)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                    .onAppear {
                        self.scale = 1.3
                        self.degree = 720
                        if !self.vm.isLoading {
                            self.vm.getNews()
                        }
                }
                Text("Loading...")
        }
    }
}

struct LoadingCell_Previews: PreviewProvider {
    static var previews: some View {
        LoadingCell(vm: NewsViewModel())
    }
}
