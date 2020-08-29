//
//  CityDetailViewControllerUITests.swift
//  CityDetailViewControllerUITests
//
//  Created by Bethany Wride on 8/27/20.
//  Copyright © 2020 Bethany Bellio. All rights reserved.
//

import XCTest
@testable import WhateverTheWeather

class CityDetailViewControllerUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    var nameLabel: XCUIElement {
        app.staticTexts["CityDetailViewController.CityNameLabel"]
    }
    var weatherIcon: XCUIElement {
        app.images["CityDetailViewController.CityWeatherIcon"]
    }
    var currentTempLabel: XCUIElement {
        app.staticTexts["CityDetailViewController.CurrentTempLabel"]
    }
    var lowLabel: XCUIElement {
        app.staticTexts["CityDetailViewController.LowTempLabel"]
    }
    var highTempLabel: XCUIElement {
        app.staticTexts["CityDetailViewController.HighTempLabel"]
    }
    var chanceOfPrecipitationLabel: XCUIElement {
        app.staticTexts["CityDetailViewController.ChanceOfPrecipitationLabel"]
    }
    
    override func setUpWithError() throws {
        app.launch()
    }

    func testSaltLakeCityDetailPageContainsAllVisualElements() throws {
        sleep(2)
        app.tables/*@START_MENU_TOKEN@*/.cells.staticTexts["Salt Lake City"]/*[[".cells.staticTexts[\"Salt Lake City\"]",".staticTexts[\"Salt Lake City\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(nameLabel.exists)
        XCTAssertTrue(weatherIcon.exists)
        XCTAssertTrue(currentTempLabel.exists)
        XCTAssertTrue(lowLabel.exists)
        XCTAssertTrue(highTempLabel.exists)
        XCTAssertTrue(chanceOfPrecipitationLabel.exists)
    }
    
    func testSanFranciscoDetailPageContainsAllVisualElements() throws {
        sleep(2)
        app.tables/*@START_MENU_TOKEN@*/.cells.staticTexts["San Francisco"]/*[[".cells.staticTexts[\"San Francisco\"]",".staticTexts[\"San Francisco\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(nameLabel.exists)
        XCTAssertTrue(weatherIcon.exists)
        XCTAssertTrue(currentTempLabel.exists)
        XCTAssertTrue(lowLabel.exists)
        XCTAssertTrue(highTempLabel.exists)
        XCTAssertTrue(chanceOfPrecipitationLabel.exists)
    }
    
    func testNewYorkCityDetailPageContainsAllVisualElements() throws {
        sleep(2)
        app.tables/*@START_MENU_TOKEN@*/.cells.staticTexts["New York City"]/*[[".cells.staticTexts[\"New York City\"]",".staticTexts[\"New York City\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(nameLabel.exists)
        XCTAssertTrue(weatherIcon.exists)
        XCTAssertTrue(currentTempLabel.exists)
        XCTAssertTrue(lowLabel.exists)
        XCTAssertTrue(highTempLabel.exists)
        XCTAssertTrue(chanceOfPrecipitationLabel.exists)
    }
    
}
