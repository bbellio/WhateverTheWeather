//
//  MasterViewController.swift
//  WhateverTheWeather
//
//  Created by Bethany Wride on 8/27/20.
//  Copyright © 2020 Bethany Bellio. All rights reserved.
//

import UIKit
import Combine

class CityListTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    private let cellIdentifier = "cityCell"
    private var subscription: AnyCancellable?
    private var cities: [City] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeToCityData()
    }
    
    
    // MARK: - Table View
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CityTableViewCell else { return UITableViewCell() }
        let city = cities[indexPath.row]
        if let cityWeather = city.weather {
            cell.update(with: city.name, temp: cityWeather.current.temp)
        }
        return cell
    }
    
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //
    }
    
    
    // MARK: - Networking
    
    func subscribeToCityData() {
        var updatedCities: [City] = []
        for city in DisplayedCities.cities {
            var city = city
            subscription = NetworkController.publishWeatherData(for: city)
                .sink(receiveCompletion: { (completion) in
                    if case let .failure(error) = completion {
                        print(error)
                    }
                }, receiveValue: { (weatherSnapshot) in
                    city.weather = weatherSnapshot
                    updatedCities.append(city)
                })
        }
        cities = updatedCities
    }
}

