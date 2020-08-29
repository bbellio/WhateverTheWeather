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
    
    // arbitrarily picking daily for pop
    private enum CodingKeys: String, CodingKey {
        case chanceOfPrecipitaion = "pop"
        case temp = "temp"
    }
    let temp: Temperature
    let chanceOfPrecipitaion: Double
    
}

struct Temperature: Decodable {
    
    let min: Double
    let max: Double
    
}

