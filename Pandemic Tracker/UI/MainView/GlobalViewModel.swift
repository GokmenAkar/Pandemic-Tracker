//
//  GlobalViewModel.swift
//  Pandemic Tracker
//
//  Created by Developer on 3.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import Foundation
import Combine

class GlobalViewModel: ObservableObject {
    @Published var allResponse: AllResponse = AllResponse(cases: 0, deaths: 0, recovered: 0, updated: 0, active: 0, affectedCountries: 0)
    @Published var countriesResponse:[CountriesResponse] = [CountriesResponse]()
    @Published var countryHistoricalData: [CountryHistoricalResponse] = [CountryHistoricalResponse]()
    
    var service = NetworkService()
    var cancellable: AnyCancellable?
    
    var isLoading = false
    func getGlobalCases() {
        guard !isLoading else { return }
        isLoading = true
        
        cancellable = service
            .baseRequest(request: AllRequest())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { (completation) in
                
            }, receiveValue: { (response) in
                self.isLoading = false
                self.allResponse = response
                self.getInfoByCountries()
            })
    }
    
    func getInfoByCountries() {
        guard !isLoading else { return }
        isLoading = true
        
        cancellable = service
            .baseRequest(request: CountriesRequest())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { (completion) in
                self.isLoading = false
                switch completion {
                case .finished:
                    print("hehe")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }, receiveValue: { (response) in
                self.isLoading = false
                self.countriesResponse = response
                self.getCountryHistoricalData()
            })
    }
    
    func getCountryHistoricalData() {
        guard !isLoading else { return }
        isLoading = true
        cancellable = service
            .baseRequest(request: CountryHistoricalRequest())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { (completion) in
                self.isLoading = false
                switch completion {
                case .finished:
                    print("hehe")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }, receiveValue: { (response) in
                self.isLoading = false
                self.countryHistoricalData = response
            })
    }
}
