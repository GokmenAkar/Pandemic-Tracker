//
//  String+Extensions.swift
//  Pandemic Tracker
//
//  Created by Developer on 4.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import Foundation

extension String {
    func convertDateStringToUIFormat() -> String {
        
        let defaultFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let uiFormat = "yyyy.MM.dd HH:mm"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = defaultFormat
        let date = dateFormatter.date(from: self)!
        dateFormatter.dateFormat = uiFormat
        let dateStr = dateFormatter.string(from: date)
        return dateStr
    }
}
