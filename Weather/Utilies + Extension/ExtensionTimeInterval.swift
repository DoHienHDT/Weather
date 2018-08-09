//
//  ExtensionTimeInterval.swift
//  Weather
//
//  Created by dohien on 08/08/2018.
//  Copyright © 2018 dohien. All rights reserved.
//

import UIKit
extension TimeInterval {
    func getDaysOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "EN")
        
        let dayOfWeek = Date(timeIntervalSince1970: self)
        
        return dateFormatter.string(from: dayOfWeek)
    }
}
