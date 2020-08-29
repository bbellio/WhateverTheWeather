//
//  DetailViewController.swift
//  WhateverTheWeather
//
//  Created by Bethany Wride on 8/27/20.
//  Copyright © 2020 Bethany Bellio. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var city: City?
    
    // MARK: - Outlets
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityWeatherIcon: UIImageView!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var chanceOfPrecipitationLabel: UILabel!
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    // MARK: - Methods
    
    func updateView() {
        guard let city = city else { return }
        cityNameLabel.text = city.name
        cityWeatherIcon.image = city.weatherIconImage
        if let currentTemp = city.weather?.current.temp {
            currentTempLabel.text = "\(currentTemp)℉"
        }
        if let minTemp = city.weather?.daily.first?.temp.min {
            lowTempLabel.text = "\(Constants.lowOf) \(minTemp)℉"
        }
        if let maxTemp = city.weather?.daily.first?.temp.max {
            highTempLabel.text = "\(Constants.highOf) \(maxTemp)℉"
        }
        if let chanceOfPrecipitation = city.weather?.daily.first?.chanceOfPrecipitaion {
            chanceOfPrecipitationLabel.text = "\(chanceOfPrecipitation) \(Constants.chanceOfPrecipitationString)"
        }
        title = "\(city.name) Weather"
    }
    
}

