//
//  CurrentWeather.swift
//  Weather App
//
//  Created by mohamed sayed on 6/9/19.
//  Copyright © 2019 mohamed Sayed. All rights reserved.
//

import Foundation

struct CurrentWeatherParameter : Codable {
    
    let timezone : String
    let currently : currently
}

struct  currently :Codable {
    let summary : String
    let icon : String
    let precipProbability : Double
    let temperature : Double
    let humidity : Double
}
