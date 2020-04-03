//
//  MainView.swift
//  Pandemic Tracker
//
//  Created by Developer on 3.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import SwiftUI
import MapKit

struct MainView: View {
    @ObservedObject var globalViewModel:GlobalViewModel = GlobalViewModel()
    @State var selectedCountry: CountriesResponse = .getExample()
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            MapView(countries: $globalViewModel.countriesResponse, selectedCountry: $selectedCountry)
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
        MainView(selectedCountry: .getExample())
    }
}
