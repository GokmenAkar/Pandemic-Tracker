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
        return CountriesResponse(country: "-", countryInfo: CountryInfo(id: 0, iso2: "-", iso3: "-", lat: 39, long: 35, flag: "-"), cases: 0, todayCases: 0, deaths: 0, todayDeaths: 0, recovered: 0, active: 0, critical: 0, casesPerOneMillion: 100, deathsPerOneMillion: 0, updated: 0)
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


