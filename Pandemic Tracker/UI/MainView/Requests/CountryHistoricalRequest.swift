//
//  CountryHistoricalRequest.swift
//  Pandemic Tracker
//
//  Created by Developer on 3.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import Foundation

class CountryHistoricalRequest: BaseAPIRequest<[CountryHistoricalResponse]> {
    override var endPoint: EndPoints {
        return .historical
    }
}
