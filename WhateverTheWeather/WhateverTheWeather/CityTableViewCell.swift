//
//  CityTableViewCell.swift
//  WhateverTheWeather
//
//  Created by Bethany Wride on 8/28/20.
//  Copyright © 2020 Bethany Bellio. All rights reserved.
//

import UIKit

/// A cell representing a given city. Displays the name, current temperature, and weather icon for the city.
class CityTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityTempLabel: UILabel!
    @IBOutlet weak var cityWeatherIcon: UIImageView!
    
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        attachAccessibilityIdentifiers()
    }
    
    
    // MARK: - Methods
    
    func update(with city: City) {
        cityNameLabel.text = city.name
        if let temp = city.weather?.current.temp {
            cityTempLabel.text = "\(temp)℉"
        }
        self.cityWeatherIcon.image = city.weatherIconImage
        self.selectionStyle = .none
    }
    
    func attachAccessibilityIdentifiers() {
        cityNameLabel.accessibilityIdentifier = Constants.tableViewPageCityNameLabelIdentifier
        cityTempLabel.accessibilityIdentifier = Constants.tableViewPageCityCurrentTempLabelIdentifier
        cityWeatherIcon.accessibilityIdentifier = Constants.tableViewPageCityWeatherIconIdentifier
        self.accessibilityIdentifier = Constants.cityTableViewCellIdentifier
    }

}
