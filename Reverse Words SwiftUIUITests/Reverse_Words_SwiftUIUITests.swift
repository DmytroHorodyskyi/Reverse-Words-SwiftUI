//
//  Reverse_Words_SwiftUIUITests.swift
//  Reverse Words SwiftUIUITests
//
//  Created by Dmytro Horodyskyi on 03.03.2023.
//
import XCTest

final class Reverse_Words_SwiftUIUITests: XCTestCase {

    func testReverseWordsDefaultModeTextInputSuccessfuly() {
 
        let app = XCUIApplication()
        app.launch()
                
        app.textFields["Text to reverse"].tap()
        app.textFields["Text to reverse"].typeText("Foxminded cool 24/7")
        
        XCTAssertEqual(
            app.staticTexts.element(matching: .any, identifier: "Result").label,
            "dednimxoF looc 24/7")
    }
    
    func testReverseWordsCustomModeTextInputSuccessfuly() {
 
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Custom"].tap()
        app.textFields["Text to reverse"].tap()
        app.textFields["Text to reverse"].typeText("Foxminded cool 24/7")
        
        app.textFields["Text to ignore"].tap()
        app.textFields["Text to ignore"].typeText("xl")
        
        XCTAssertEqual(
            app.staticTexts.element(matching: .any, identifier: "Result").label,
            "dexdnimoF oocl 7/42")
    }
}
