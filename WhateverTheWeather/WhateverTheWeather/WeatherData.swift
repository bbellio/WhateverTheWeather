//
//  WeatherSnapshot.swift
//  WhateverTheWeather
//
//  Created by Bethany Wride on 8/28/20.
//  Copyright © 2020 Bethany Bellio. All rights reserved.
//

import Foundation

struct WeatherSnapshot: Decodable {
    
    let current: CurrentWeather
    let daily: [DailyWeather]
    
}

struct CurrentWeather: Decodable {
    
    let temp: Double
    let weather: [WeatherFacts]
    
}

struct WeatherFacts: Decodable {
    
    let icon: String
    
}

struct DailyWeather: Decodable {

    private enum CodingKeys: String, CodingKey {
        case chanceOfPrecipitaion = "pop"
        case temp = "temp" // I know this isn't necessary, but it wasn't compiling without it
    }
    
    let temp: TemperatureOverview
    let chanceOfPrecipitaion: Double
    
}

struct TemperatureOverview: Decodable {
    
    let min: Double
    let max: Double
    
}

