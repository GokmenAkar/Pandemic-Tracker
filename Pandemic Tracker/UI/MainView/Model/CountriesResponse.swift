//
//  CountriesResponse.swift
//  Pandemic Tracker
//
//  Created by Developer on 3.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import Foundation
import SwiftUI

struct CountriesResponse: Codable {
    let country: String
    let countryInfo: CountryInfo
    let cases, todayCases, deaths, todayDeaths: Int
    let recovered, active, critical: Int
    let casesPerOneMillion, deathsPerOneMillion: Double?
    let updated: Int
    
    static func getExample() -> CountriesResponse {
        return CountriesResponse(country: "Turkey", countryInfo: CountryInfo(id: 792, iso2: "tr", iso3: "tr", lat: 39, long: 35, flag: "https://raw.githubusercontent.com/NovelCOVID/API/master/assets/flags/tr.png"), cases: 100, todayCases: 100, deaths: 100, todayDeaths: 100, recovered: 100, active: 100, critical: 100, casesPerOneMillion: 100, deathsPerOneMillion: 100, updated: 1585928447598)
    }
    
    var dangerColor: LinearGradient {
        switch cases {
        case 0...10000:
            return LinearGradient(gradient: Gradient(colors: [Color(hex: "eef9bf"),Color(hex: "a7e9af"),Color(hex: "75b79e")]), startPoint: .topLeading, endPoint: .bottomTrailing)
        case 10001...100000:
            return LinearGradient(gradient: Gradient(colors: [Color(hex: "b7472a"),Color(hex: "eb9788"),Color(hex: "ffd5ab")]), startPoint: .topLeading, endPoint: .bottomTrailing)
        case 100000...1_000_000_000:
            return LinearGradient(gradient: Gradient(colors: [Color(hex: "9d0b0b"),Color(hex: "da2d2d"),Color(hex: "eb8242")]), startPoint: .topLeading, endPoint: .bottomTrailing)
        default:
            return LinearGradient(gradient: Gradient(colors: [Color(hex: "9d0b0b"),Color(hex: "da2d2d"),Color(hex: "eb8242")]), startPoint: .topLeading, endPoint: .bottomTrailing)
        }
    }
}

// MARK: - CountryInfo
struct CountryInfo: Codable {
    let id: Int?
    let iso2, iso3: String?
    let lat, long: Double
    let flag: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case iso2, iso3, lat, long, flag
    }
}


