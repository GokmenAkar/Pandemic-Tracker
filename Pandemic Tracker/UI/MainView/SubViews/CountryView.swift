//
//  CountryView.swift
//  Pandemic Tracker
//
//  Created by Developer on 3.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct CountryView: View {
    
    var country: CountriesResponse
    
    @Binding var cases: [Double]
    @Binding var deaths: [Double]
    @Binding var recovered: [Double]
    
    var body: some View {
        VStack {
            VStack(alignment: .trailing) {
                Text(country.country).font(.system(size: 14, weight: .semibold))
                
                Group {
                    HStack(spacing: 0) {
                        GlobalTitleText(title: "Cases: ", value: country.cases, type: .cases)
                    }
                    HStack(spacing: 0) {
                        GlobalTitleText(title: "Today Cases: ", value: country.todayCases, type: .cases)
                    }
                    
                    HStack(spacing: 0) {
                        GlobalTitleText(title: "Critical: ", value: country.critical, type: .cases)
                    }
                    
                    HStack(spacing: 0) {
                        GlobalTitleText(title: "Deaths: ", value: country.deaths, type: .death)
                    }
                    
                    HStack(spacing: 0) {
                        GlobalTitleText(title: "Today Deaths: ", value: country.todayDeaths, type: .death)
                    }
                    
                    HStack(spacing: 0) {
                        GlobalTitleText(title: "Recovered: ", value: country.recovered, type: .recovered)
                    }
                    
                    HStack(spacing: 0) {
                        GlobalTitleText(title: "Active: ", value: country.active, type: .active)
                    }
                    
                    HStack(spacing: 0) {
                        GlobalTitleText(title: "Affected Countries: ", value: country.cases, type: .affected)
                    }
                    
                    HStack(spacing: 0) {
                        GlobalTitleText(title: "Last Update: ", value: country.updated, type: .lastUpdate)
                    }
                }
                
            }
            .padding(4)
            .background(RoundedRectangle(cornerRadius: 10).stroke(country.dangerColor, lineWidth: 4))
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.lightAndDark.opacity(0.9)))
//            Spacer()
            MultiLineChartView(data: [(cases, GradientColors.orange), (deaths, GradientColors.green), (recovered, GradientColors.green)], title: "Last 30 Days")
//            LineChartView(data: cases, title: "Cases", legend: "Last 30 Days")
        }
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView(country: CountriesResponse.getExample(), cases: .constant([0]), deaths: .constant([0]), recovered: .constant([0]))
            .previewLayout(.sizeThatFits)
    }
}
