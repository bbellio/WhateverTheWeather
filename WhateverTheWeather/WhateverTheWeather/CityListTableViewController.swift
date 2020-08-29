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
    private let segueIdentifier = "toDetailVC"
    private var cities: [City] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCityData()
        tableView.rowHeight = 44
    }
    
    
    // MARK: - TableView Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CityTableViewCell else { return UITableViewCell() }
        let city = cities[indexPath.row]
        cell.update(with: city)
        return cell
    }
    
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let destination = segue.destination as? CityDetailViewController else { return }
            destination.city = cities[indexPath.row]
        }
    }
    
    
    // MARK: - Networking
    
    /// A method that makes the network call to obtain weather data for each city in `DisplayedCities.`
    func fetchCityData() {
        for city in DisplayedCities.cities {
            var city = city
            NetworkController.getWeather(for: city) { (weather) in
                city.weather = weather
                NetworkController.getImage(for: city) { (image) in
                    city.weatherIconImage = image
                    self.cities.append(city)
                }
            }
        }
    }
    
}

