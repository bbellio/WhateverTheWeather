//
//  City.swift
//  WhateverTheWeather
//
//  Created by Bethany Wride on 8/28/20.
//  Copyright © 2020 Bethany Bellio. All rights reserved.
//

import Foundation
import UIKit

struct City {
    
    let name: String
    let lon: Double
    let lat: Double
    // Assigned
    var weather: WeatherSnapshot?
    var weatherIconImage: UIImage?
    
}

struct HardCodedCities {
    
    static let saltLakeCity = City(name: "Salt Lake City", lon: -111.891052, lat: 40.76078)
    static let sanFrancisco = City(name: "San Francisco", lon: -122.419418, lat: 37.774929)
    static let newYorkCity = City(name: "New York City", lon:  -74.005966, lat: 40.714272)

}

struct DisplayedCities {
    
    static let cities: [City] = [HardCodedCities.saltLakeCity, HardCodedCities.sanFrancisco, HardCodedCities.newYorkCity]
    
}

