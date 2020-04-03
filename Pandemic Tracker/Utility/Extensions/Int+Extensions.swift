//
//  Int+Extensions.swift
//  Pandemic Tracker
//
//  Created by Developer on 3.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import Foundation

extension Int {
    func formatCurrency() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.numberStyle = .decimal
        let formattedString = numberFormatter.string(from: NSNumber(value: self)) ?? "-"
        return formattedString
    }
    
    func convertToDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let date = Date(timeIntervalSince1970: Double(self) / 1000.0)
        let formattedDate = formatter.string(from: date)
        return formattedDate
    }
}
