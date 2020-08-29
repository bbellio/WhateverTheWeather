//
//  Constants.swift
//  WhateverTheWeather
//
//  Created by Bethany Wride on 8/28/20.
//  Copyright © 2020 Bethany Bellio. All rights reserved.
//

import Foundation

struct Constants {
    
    // MARK: - Networking
    
    static let baseURL = URL(string: "https://api.openweathermap.org/data/2.5/onecall")
    static let imageURL = URL(string: "https://openweathermap.org/img/wn")
    static let lat = "lat"
    static let lon = "lon"
    static let appID = "appid"
    static let apiKey = "da65fafb6cb9242168b7724fb5ab75e7"
    static let units = "units"
    static let unitsValue = "imperial"
    // A fake snapshot data to publish when failing
    static let failed = WeatherSnapshot(current: CurrentWeather(temp: 0, weather: []), daily: [])
    
    
    // MARK: - Details Page
    
    static let chanceOfPrecipitationString = "percent chance of precipitation"
    static let highOf = "high of"
    static let lowOf = "low of"
}
