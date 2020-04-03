//
//  EndPoints.swift
//  Pandemic Tracker
//
//  Created by Developer on 3.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import Foundation

enum EndPoints: StringLiteralType {
    case countries = "countries/"
    case all       = "all"
    case episode   = "v2/historical"
    case jhucsse   = "v2/jhucsse"
    
    var description: String {
        return self.rawValue
    }
}
