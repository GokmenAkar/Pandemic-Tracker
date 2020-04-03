//
//  AllResponse.swift
//  Pandemic Tracker
//
//  Created by Developer on 3.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import Foundation

struct AllResponse: Codable {
    let cases: Int
    let deaths: Int
    let recovered: Int
    let updated: Int
    let active: Int
    let affectedCountries: Int
}
