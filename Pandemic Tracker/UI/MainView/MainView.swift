//
//  MainView.swift
//  Pandemic Tracker
//
//  Created by Developer on 3.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import SwiftUI
import MapKit
import SwiftUICharts

struct MainView: View {
    @ObservedObject var globalViewModel:GlobalViewModel = GlobalViewModel()
    @State var selectedCountry: CountriesResponse = .getExample()
    @State var selectedCountryHistoricalData = [Double]()
    var body: some View {
        ZStack(alignment: .topLeading) {
            MapView(countries: $globalViewModel.countriesResponse, selectedCountry: $selectedCountry, selectedCountryHistoricalData:    $selectedCountryHistoricalData, response: globalViewModel.countryHistoricalData)
            LineView(data: selectedCountryHistoricalData, title: "Line chart", legend: "Full screen").padding()

            HStack(alignment: .top) {
                GlobalInfoView(allResponse: $globalViewModel.allResponse)
                    .offset(x: 4, y: 24)
                Spacer()
                CountryView(country: selectedCountry)
                    .offset(x: -4, y: 24)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
                self.globalViewModel.getGlobalCases()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(selectedCountry: .getExample(), selectedCountryHistoricalData: [8,23,54,32,12,37,7,23,43])//selectedCountryHistoricalData: .init(country: "", province: "", timeline: Timeline(cases: ["String" : 0], deaths: ["String" : 0], recovered: ["String" : 0])))
    }
}
