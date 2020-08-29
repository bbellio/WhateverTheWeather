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
    let name: String
    
}

struct CurrentWeather: Decodable {
    
    let temp: Int
    let weather: [WeatherFacts]
    
}

struct WeatherFacts: Decodable {
    
//    let description: String
    let icon: String
    
}

struct DailyWeather: Decodable {
    
    // arbitrarily picking daily for pop
    
    private enum CodingKeys: String, CodingKey {
        case chanceOfPrecipitaion = "pop"
    }
    
    let chanceOfPrecipitaion: Int
    
}

struct Temperature: Decodable {
    
    let min: Int
    let max: Int
    
}

