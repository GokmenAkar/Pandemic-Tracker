//
//  GlobalInfoView.swift
//  Pandemic Tracker
//
//  Created by Developer on 3.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import SwiftUI

struct GlobalInfoView: View {
    @Binding var allResponse: AllResponse
    var body: some View {
        VStack(alignment: .leading) {
            Text("Global Stats").font(.system(size: 14, weight: .semibold))
            HStack(spacing: 0) {
                GlobalTitleText(title: "Cases: ", value: allResponse.cases, type: .cases)
            }
            
            HStack(spacing: 0) {
                GlobalTitleText(title: "Death: ", value: allResponse.deaths, type: .death)
            }
            
            HStack(spacing: 0) {
                GlobalTitleText(title: "Recovered: ", value: allResponse.recovered, type: .recovered)
            }
            
            HStack(spacing: 0) {
                GlobalTitleText(title: "Active: ", value: allResponse.cases, type: .active)
            }
            
            HStack(spacing: 0) {
                GlobalTitleText(title: "Affected Countries: ", value: allResponse.cases, type: .affected)
            }
            
            HStack(spacing: 0) {
                GlobalTitleText(title: "Last Update: ", value: allResponse.updated, type: .lastUpdate)
            }
        }
        .padding(4)
        
        .background(RoundedRectangle(cornerRadius: 10).stroke(LinearGradient(gradient: Gradient(colors: [Color(hex: "00a8cc"),Color(hex: "0c7b93"),Color(hex: "27496d")]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 4))
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.9)))

    }
}

struct GlobalTitleText: View {
    enum TitleColorByValue {
        case cases
        case death
        case recovered
        case active
        case affected
        case lastUpdate
        
        var color: Color {
            switch self {
            case .cases: return .orange
            case .death: return .red
            case .recovered: return .green
            default: return .black
            }
        }
    }
    
    
    var title: String
    var value: Int
    var type: TitleColorByValue
    
    var body: some View {
        HStack(spacing: 0) {
            Text(title)
                .font(.system(size: 12, weight: .light, design: .rounded))
            Text(self.type == .lastUpdate ? value.convertToDate() : value.formatCurrency())
                .font(.system(size: 12, weight: .medium)).foregroundColor(type.color)
        }
    }
}


struct GlobalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GlobalInfoView(allResponse: .constant(GlobalViewModel().allResponse))
        .previewLayout(.sizeThatFits)
    }
}
