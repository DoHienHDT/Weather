//
//  Forecastday.swift
//  Weather
//
//  Created by dohien on 08/08/2018.
//  Copyright © 2018 dohien. All rights reserved.
//

import UIKit
class Forecastday {
    var name: String
    var temp_c: Int
    var localtime_epoch: TimeInterval
    var humidity: Double
    var wind_kph: Double
    var vis_km: Double
    var weatherDay: [ArrayForecastday] = []
    init(dictionary: DICT) {
        let location = dictionary["location"] as? DICT ?? [:]
        name = location["name"] as? String ?? "-1"
        localtime_epoch = location["localtime_epoch"] as? TimeInterval ?? -1
        let current = dictionary["current"] as? DICT ?? [:]
        temp_c = current["temp_c"] as? Int ?? -1
        humidity = current["humidity"] as? Double ?? -1
        wind_kph = current["wind_kph"] as? Double ?? -1
        vis_km = current["vis_km"] as? Double ?? -1
        let forecast = dictionary["forecast"] as? DICT ?? [:]
        let forecastday = forecast["forecastday"] as? [DICT] ?? []
//        let zero = forecastday[0]
//        date_epoch = zero["date_epoch"] as? TimeInterval ?? -1
        for dataWeather in forecastday {
            weatherDay.append(ArrayForecastday(dictionary: dataWeather))
        }
    }
}
struct ArrayForecastday {
    var date_epoch: TimeInterval
    var maxtemp_c: Double
    var mintemp_c: Double
    var icon: String
    init(dictionary: DICT) {
        date_epoch = dictionary["date_epoch"] as? TimeInterval ?? -1
        let day = dictionary["day"] as? DICT ?? [:]
        maxtemp_c = day["maxtemp_c"] as? Double ?? -1
        mintemp_c = day["mintemp_c"] as? Double ?? -1
        let condition = day["condition"] as? DICT ?? [:]
        icon = "http:" + (condition["icon"] as? String ?? "-1")
    }
}
