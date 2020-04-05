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
    
    @State var selectedCountryCases     = [Double]()
    @State var selectedCountryDeaths    = [Double]()
    @State var selectedCountryRecovered = [Double]()

    var body: some View {
        ZStack(alignment: .topLeading) {
            MapView(countries: $globalViewModel.countriesResponse,
                    selectedCountry: $selectedCountry,
                    selectedCountryCases: $selectedCountryCases,
                    selectedCountryDeaths: $selectedCountryDeaths,
                    selectedCountryRecovered: $selectedCountryRecovered,
                    countryHistoricalData: $globalViewModel.countryHistoricalData)
                .edgesIgnoringSafeArea(.all)
            HStack(alignment: .top) {
                GlobalInfoView(allResponse: $globalViewModel.allResponse)
                    .offset(x: 4, y: 24)
                Spacer()
                CountryView(country: selectedCountry, cases: $selectedCountryCases, deaths: $selectedCountryDeaths, recovered: $selectedCountryRecovered)
                    .offset(x: -4, y: 24)
            }
        }
        
        .onAppear {
                self.globalViewModel.getGlobalCases()
        }
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView(selectedCountry: .getExample(), selectedCountryHistoricalData: [8,23,54,32,12,37,7,23,43]).environment(\.colorScheme, .dark)//selectedCountryHistoricalData: .init(country: "", province: "", timeline: Timeline(cases: ["String" : 0], deaths: ["String" : 0], recovered: ["String" : 0])))
//    }
//}
