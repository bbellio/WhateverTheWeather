//
//  CityListTableViewControllerUITests.swift
//  WhateverTheWeatherUITests
//
//  Created by Bethany Wride on 8/29/20.
//  Copyright © 2020 Bethany Bellio. All rights reserved.
//

import XCTest

class CityListTableViewCellUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    var cell: XCUIElement {
        app.tables.cells["CityListTableViewCell"]
    }
    var nameLabel: XCUIElement {
        app.staticTexts["CityListTableViewCell.CityNameLabel"]
    }
    var currentTempLabel: XCUIElement {
        app.staticTexts["CityListTableViewCell.CityTempLabel"]
    }
    
    override func setUpWithError() throws {
        app.launch()
    }

    func testCityTableViewCellDisplaysAllVisualElements() throws {
        XCTAssertTrue(cell.exists)
        sleep(2)
        XCTAssertTrue(nameLabel.exists)
        XCTAssertTrue(currentTempLabel.exists)
    }

}
