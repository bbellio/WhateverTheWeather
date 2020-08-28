//
//  WeatherSnapshot.swift
//  WhateverTheWeather
//
//  Created by Bethany Wride on 8/28/20.
//  Copyright © 2020 Bethany Bellio. All rights reserved.
//

import Foundation


//struct City {
//    let name: String
//    let long: Int
//    let lat: Int
//}

struct WeatherSnapshot {
    
    let current: CurrentWeather
    let daily: [DailyWeather]
    let name: String
    
}

struct CurrentWeather {
    
    let temp: Int
    let weather: [WeatherFacts]
    
}

struct WeatherFacts {
    
//    let description: String
    let icon: String
    
}

struct DailyWeather {
    
    // arbitrarily picking daily for pop
    
    private enum CodingKeys: String, CodingKey {
        case chanceOfPrecipitaion = "pop"
    }
    
    let chanceOfPrecipitaion: Int
    
}

struct Temperature {
    
    let min: Int
    let max: Int
    
}
