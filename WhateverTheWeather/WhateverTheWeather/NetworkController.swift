//
//  NetworkController.swift
//  WhateverTheWeather
//
//  Created by Bethany Wride on 8/28/20.
//  Copyright © 2020 Bethany Bellio. All rights reserved.
//

import Foundation
import Combine
import UIKit

struct NetworkController {
    
    /// A newtork call that completes with a `WeatherSnapshot` for a given city.
    static func getWeather(for city: City, completion: @escaping (WeatherSnapshot) -> Void) {
        guard let baseURL = Constants.baseURL else { return }
        let latQueryItem = URLQueryItem(name: Constants.lat, value: "\(city.lat)")
        let lonQueryItem = URLQueryItem(name: Constants.lon, value: "\(city.lon)")
        let unitsQueryItem = URLQueryItem(name: Constants.units, value: Constants.unitsValue)
        let apiKeyQueryItem = URLQueryItem(name: Constants.appID, value: Constants.apiKey)
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [latQueryItem, lonQueryItem, unitsQueryItem, apiKeyQueryItem]
        guard let finalURL = urlComponents?.url else { return }
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Error in dataTask : \(error.localizedDescription) \n---\n \(error)")
                return
            }
            guard let data = data else {
                print("No data")
                return
            }
            do {
                let decodedSearchResults = try JSONDecoder().decode(WeatherSnapshot.self, from: data)
                completion(decodedSearchResults)
            } catch {
                let error = error
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
    
    /// A newtork call that completes with a `UIImage` to display the weather icon for a given city.
    static func getImage(for city: City, completion: @escaping (UIImage) -> Void) {
        guard let imageURL = Constants.imageURL, let imageIconString = city.weather?.current.weather.first?.icon else {
            print("No URL")
            return
        }
        let completeURL = imageURL.appendingPathComponent("\(imageIconString)@2x.png")
        URLSession.shared.dataTask(with: completeURL) { (data, _, error) in
            if let error = error {
                print("Error in dataTask : \(error.localizedDescription) \n---\n \(error)")
                return
            }
            guard let data = data else {
                print("No data")
                return
            }
            guard let image = UIImage(data: data) else {
                print("No image")
                return
            }
            completion(image)
        }.resume()
    }
    
    // MARK: - Combine
    
    // NOTE: - These functions are not currently used, but could be implemented in the future. They accomplish the same thing as the code above but utilize Combine.
    
    /// Publishes a `WeatherSnapshot` for a given city.
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
    
    /// Publishes a weather icon `UIImage` for a given city.
    static func publishWeatherIcon(for city: City) -> AnyPublisher<UIImage, Error> {
        guard let baseURL = Constants.baseURL else { return Just(UIImage()).setFailureType(to: Error.self).eraseToAnyPublisher() }
        let latQueryItem = URLQueryItem(name: Constants.lat, value: "\(city.lat)")
        let lonQueryItem = URLQueryItem(name: Constants.lon, value: "\(city.lon)")
        let unitsQueryItem = URLQueryItem(name: Constants.units, value: Constants.unitsValue)
        let apiKeyQueryItem = URLQueryItem(name: Constants.appID, value: Constants.apiKey)
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [latQueryItem, lonQueryItem, unitsQueryItem, apiKeyQueryItem]
        guard let finalURL = urlComponents?.url else { return Just(UIImage()).setFailureType(to: Error.self).eraseToAnyPublisher() }
        return URLSession.shared.dataTaskPublisher(for: finalURL)
            .map({$0.data})
            .map({(UIImage(data: $0) ?? UIImage())})
            .mapError({ (error) -> Error in
                return URLErrorWrapper(error: error) // This allows you to return an AnyPublisher<UIImage, Error>
            })
            .eraseToAnyPublisher()
    }
    
}

struct URLErrorWrapper: Error {
    
    let error: URLError
    
}


