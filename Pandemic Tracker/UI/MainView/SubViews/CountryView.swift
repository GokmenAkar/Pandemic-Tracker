//
//  CountryView.swift
//  Pandemic Tracker
//
//  Created by Developer on 3.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import SwiftUI

struct CountryView: View {
    
   
    
    var country: CountriesResponse
    
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text(country.country).font(.system(size: 14, weight: .semibold))
            
            HStack(spacing: 0) {
                GlobalTitleText(title: "Cases: ", value: country.cases, type: .cases)
            }
            HStack(spacing: 0) {
                GlobalTitleText(title: "Today Cases: ", value: country.todayCases, type: .cases)
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
                GlobalTitleText(title: "Active: ", value: country.cases, type: .active)
            }
            
            HStack(spacing: 0) {
                GlobalTitleText(title: "Critical: ", value: country.critical, type: .cases)
            }
            
            
            HStack(spacing: 0) {
                GlobalTitleText(title: "Affected Countries: ", value: country.cases, type: .affected)
            }
            
            HStack(spacing: 0) {
                GlobalTitleText(title: "Last Update: ", value: country.updated, type: .lastUpdate)
            }
        }.padding(4)
            
            .background(RoundedRectangle(cornerRadius: 10).stroke(country.dangerColor, lineWidth: 4))
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.9)))
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView(country: CountriesResponse.getExample())
            .previewLayout(.sizeThatFits)
    }
}
