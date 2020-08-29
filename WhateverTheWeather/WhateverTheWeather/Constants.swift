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
    static let failed = WeatherSnapshot(current: CurrentWeather(temp: 0, weather: []), daily: []) // A fake WeatherSnapshot to publish when a network call fails (currently not being used; would be used in the Combine methods in the NetworkController).
    
    
    // MARK: - CityDetailsViewController
    
    static let chanceOfPrecipitationString = "% chance of precipitation"
    static let highOf = "high of"
    static let lowOf = "low of"
    
    
    // MARK: - Accessibility Identifiers
    
    static let detailPageCityNameLabelIdentifier = "CityDetailViewController.CityNameLabel"
    static let detailPageCityWeatherIconIdentifier = "CityDetailViewController.CityWeatherIcon"
    static let detailPageCurrentTempLabelIdentifier = "CityDetailViewController.CurrentTempLabel"
    static let lowTempLabelIdentifier = "CityDetailViewController.LowTempLabel"
    static let highTempLabelIdentifier = "CityDetailViewController.HighTempLabel"
    static let chanceOfPrecipitationLabelIdentifier = "CityDetailViewController.ChanceOfPrecipitationLabel"
    
    static let tableViewPageCityNameLabelIdentifier = "CityListTableViewCell.CityNameLabel"
    static let tableViewPageCityCurrentTempLabelIdentifier = "CityListTableViewCell.CityTempLabel"
    static let tableViewPageCityWeatherIconIdentifier = "CityListTableViewCell.CityWeatherIcon"
    static let cityTableViewCellIdentifier = "CityListTableViewCell"
    
}
