//
//  WhateverTheWeatherTests.swift
//  WhateverTheWeatherTests
//
//  Created by Bethany Wride on 8/27/20.
//  Copyright © 2020 Bethany Bellio. All rights reserved.
//

import XCTest
@testable import WhateverTheWeather

class WhateverTheWeatherTests: XCTestCase {
    
    var testWeatherData: WeatherSnapshot!
    var city: City!
    
    override func setUpWithError() throws {
        testWeatherData = WeatherSnapshot(current: CurrentWeather(temp: 50, weather: [WeatherFacts(icon: "")]), daily: [DailyWeather(temp: TemperatureOverview(min: 25, max: 75), chanceOfPrecipitaion: 0.5)])
        city = HardCodedCities.saltLakeCity
    }

    func testWeatherDataURLIsAssembledCorrectly() throws {
        let baseURLString = "https://api.openweathermap.org/data/2.5/onecall"
        guard let baseURL = URL(string: baseURLString) else { return }
        let latQueryItem = URLQueryItem(name: "lat", value: "\(city.lat)")
        let lonQueryItem = URLQueryItem(name: "lon", value: "\(city.lon)")
        let unitsQueryItem = URLQueryItem(name: "units", value: "imperial")
        let apiKeyQueryItem = URLQueryItem(name: "appid", value: "da65fafb6cb9242168b7724fb5ab75e7")
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [latQueryItem, lonQueryItem, unitsQueryItem, apiKeyQueryItem]
        let finalURL = urlComponents?.url
        let finalURLString = "https://api.openweathermap.org/data/2.5/onecall?lat=40.76078&lon=-111.891052&units=imperial&appid=da65fafb6cb9242168b7724fb5ab75e7"
        XCTAssertEqual(finalURL, URL(string: finalURLString))
    }
    
    func testWeatherIconURLIsAssembledCorrectly() throws {
        let baseURLString = "https://openweathermap.org/img/wn"
        guard let baseURL = URL(string: baseURLString) else { return }
        let exampleImageIconString = "10n"
        let finalURL = baseURL.appendingPathComponent("\(exampleImageIconString)@2x.png")
        let finalURLString = "https://openweathermap.org/img/wn/10n@2x.png"
        XCTAssertEqual(finalURL, URL(string: finalURLString))
    }

    func testChanceOfPrecipitationConversionToPercentage() throws {
        let chanceOfPrecipitation = testWeatherData.daily.first?.chanceOfPrecipitaion
        XCTAssertEqual(chanceOfPrecipitation, 0.5)
        let percentage = Int(chanceOfPrecipitation! * 100)
        XCTAssertEqual(percentage, 50)
    }

}
