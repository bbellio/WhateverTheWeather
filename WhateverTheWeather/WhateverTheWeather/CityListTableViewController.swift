//
//  MasterViewController.swift
//  WhateverTheWeather
//
//  Created by Bethany Wride on 8/27/20.
//  Copyright © 2020 Bethany Bellio. All rights reserved.
//

import UIKit


class CityListTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    private let cellIdentifier = "cityCell"
    private var cities: [City] = []
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
}

