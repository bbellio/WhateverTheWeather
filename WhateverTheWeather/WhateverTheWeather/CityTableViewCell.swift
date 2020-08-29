//
//  CityTableViewCell.swift
//  WhateverTheWeather
//
//  Created by Bethany Wride on 8/28/20.
//  Copyright © 2020 Bethany Bellio. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityTempLabel: UILabel!
    @IBOutlet weak var cityWeatherIcon: UIImageView!
    
    
    // MARK: - Methods
    
    func update(with name: String, temp: Int) {
        cityNameLabel.text = name
        cityTempLabel.text = "\(temp)℉"
    }

}
