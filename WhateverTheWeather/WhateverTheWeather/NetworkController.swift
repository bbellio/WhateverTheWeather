//
//  NetworkController.swift
//  WhateverTheWeather
//
//  Created by Bethany Wride on 8/28/20.
//  Copyright © 2020 Bethany Bellio. All rights reserved.
//

import Foundation
import Combine

struct NetworkController {
    
    static func publishWeatherData(for city: City) -> AnyPublisher<WeatherSnapshot, Error> {
        guard let baseURL = Constants.baseURL else { return Just(Constants.failed).setFailureType(to: Error.self).eraseToAnyPublisher()  }
        let latQueryItem = URLQueryItem(name: Constants.lat, value: "\(city.lat)")
        let lonQueryItem = URLQueryItem(name: Constants.lon, value: "\(city.lon)")
        let unitsQueryItem = URLQueryItem(name: Constants.units, value: Constants.unitsValue)
        let apiKeyQueryItem = URLQueryItem(name: Constants.appID, value: Constants.apiKey)
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [latQueryItem, lonQueryItem, unitsQueryItem, apiKeyQueryItem]
        guard let finalURL = urlComponents?.url else { return Just(Constants.failed).setFailureType(to: Error.self).eraseToAnyPublisher() }
        return URLSession.shared.dataTaskPublisher(for: finalURL)
            .map({$0.data})
            .decode(type: WeatherSnapshot.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
