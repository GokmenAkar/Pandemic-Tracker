//
//  CountryHistoricalResponse.swift
//  Pandemic Tracker
//
//  Created by Developer on 3.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import Foundation

struct CountryHistoricalResponse: Codable {
    let country: String
    let province: String?
    let timeline: Timeline
}

// MARK: - Timeline
struct Timeline: Codable {
    let cases, deaths, recovered: [String: Int]
}
