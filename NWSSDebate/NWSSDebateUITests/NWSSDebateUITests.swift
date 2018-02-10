//
//  NWSSDebateUITests.swift
//  NWSSDebateUITests
//
//  Created by Selena Liu on 2018-02-04.
//  Copyright © 2018 Selena Liu. All rights reserved.
//

import XCTest
@testable import NWSSDebate

class NWSSDebateUITests: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//    func testIndividualTimer() {
//        let durationExpectation = expectation(description: "durationExpectation")
//        let seconds = TimeInterval(singleTimerUnderTest.seconds + 3)
//        let minutes = TimeInterval(singleTimerUnderTest.minutes - 6)
//
//        _ = singleTimerUnderTest.updateTimer()
//        DispatchQueue.main.asyncAfter(wallDeadline: .now() + seconds, execute: {durationExpectation.fulfill()})
//        waitForExpectations(timeout: seconds + 1, handler: nil)
//    }
    
    func testExample() {
        
        let app = XCUIApplication()

        
        XCTAssert(app.buttons["Individual Timer"].exists)
        XCTAssert(app.buttons["Full Debate Timer"].exists)
        XCTAssert(app.buttons["Format Information"].exists)
        
        app.buttons["Individual Timer"].tap()
        let startButton = app.buttons["Start"]
        let pauseButton = app.buttons["Pause"]
        let resetButton = app.buttons["Reset"]
        let resumeButton = app.buttons["Resume"]
        XCTAssertEqual(startButton.isHittable, true)
        [pauseButton,
         resetButton].forEach { XCTAssertEqual($0.isEnabled, false) }
        app.buttons["Start"].tap()
        [startButton,
         resetButton].forEach { XCTAssertEqual($0.isEnabled, false) }
        pauseButton.tap()
        XCTAssertEqual(startButton.isEnabled, false)
        [resumeButton,
         resetButton].forEach { XCTAssertEqual($0.isEnabled, true) }
        app.buttons["Reset"].tap()
        XCTAssertEqual(startButton.isEnabled, true)
        [pauseButton,
         resetButton].forEach { XCTAssertEqual($0.isEnabled, false) }
        
        
        app.navigationBars["Individual Timer"].buttons["Back"].tap()
        
        app.buttons["Full Debate Timer"].tap()
        app.navigationBars["Select Format"].buttons["Back"].tap()
        app.buttons["Full Debate Timer"].tap()
        [app.staticTexts["First Proposition"],
         app.staticTexts["First Opposition"],
         app.staticTexts["Second Proposition"],
         app.staticTexts["Second Opposition"],
         app.staticTexts["First Opposition"],
         app.staticTexts["First Proposition"],
         app.staticTexts["6:00"],
         app.staticTexts["6:00"],
         app.staticTexts["6:00"],
         app.staticTexts["6:00"],
         app.staticTexts["3:00"],
         app.staticTexts["3:00"]].forEach { XCTAssert($0.exists) }
        
        app/*@START_MENU_TOKEN@*/.buttons["British Parliament"]/*[[".segmentedControls.buttons[\"British Parliament\"]",".buttons[\"British Parliament\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        [app.staticTexts["Prime Minister"],
         app.staticTexts["Leader of Opposition"],
         app.staticTexts["Deputy Prime Minister"],
         app.staticTexts["Deputy Leader of Opposition"],
         app.staticTexts["Member of Government"],
         app.staticTexts["Member of Opposition"],
         app.staticTexts["Government Whip"],
         app.staticTexts["Opposition Whip"],
         app.staticTexts["7:00"],
         app.staticTexts["7:00"],
         app.staticTexts["7:00"],
         app.staticTexts["7:00"],
         app.staticTexts["7:00"],
         app.staticTexts["7:00"],
         app.staticTexts["7:00"],
         app.staticTexts["7:00"]].forEach { XCTAssert($0.exists) }
        
        app/*@START_MENU_TOKEN@*/.buttons["Senior"]/*[[".segmentedControls.buttons[\"Senior\"]",".buttons[\"Senior\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        [app.staticTexts["Prime Minister"],
         app.staticTexts["Leader of Opposition"],
         app.staticTexts["Deputy Prime Minister"],
         app.staticTexts["Deputy Leader of Opposition"],
         app.staticTexts["Member of Government"],
         app.staticTexts["Member of Opposition"],
         app.staticTexts["Government Whip"],
         app.staticTexts["Opposition Whip"],
         app.staticTexts["7:00"],
         app.staticTexts["7:00"],
         app.staticTexts["7:00"],
         app.staticTexts["7:00"],
         app.staticTexts["7:00"],
         app.staticTexts["7:00"],
         app.staticTexts["7:00"],
         app.staticTexts["7:00"]].forEach { XCTAssert($0.exists) }
        
        app/*@START_MENU_TOKEN@*/.buttons["Junior"]/*[[".segmentedControls.buttons[\"Junior\"]",".buttons[\"Junior\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        [app.staticTexts["Prime Minister"],
         app.staticTexts["Leader of Opposition"],
         app.staticTexts["Deputy Prime Minister"],
         app.staticTexts["Deputy Leader of Opposition"],
         app.staticTexts["Member of Government"],
         app.staticTexts["Member of Opposition"],
         app.staticTexts["Government Whip"],
         app.staticTexts["Opposition Whip"],
         app.staticTexts["7:00"],
         app.staticTexts["7:00"],
         app.staticTexts["7:00"],
         app.staticTexts["7:00"],
         app.staticTexts["7:00"],
         app.staticTexts["7:00"],
         app.staticTexts["7:00"],
         app.staticTexts["7:00"]].forEach { XCTAssert($0.exists) }
        
        app/*@START_MENU_TOKEN@*/.buttons["CNDF"]/*[[".segmentedControls.buttons[\"CNDF\"]",".buttons[\"CNDF\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        [app.staticTexts["First Proposition"],
         app.staticTexts["First Opposition"],
         app.staticTexts["Second Proposition"],
         app.staticTexts["Second Opposition"],
         app.staticTexts["First Opposition"],
         app.staticTexts["First Proposition"],
         app.staticTexts["6:00"],
         app.staticTexts["6:00"],
         app.staticTexts["6:00"],
         app.staticTexts["6:00"],
         app.staticTexts["3:00"],
         app.staticTexts["3:00"]].forEach { XCTAssert($0.exists) }
        
        app/*@START_MENU_TOKEN@*/.buttons["Senior"]/*[[".segmentedControls.buttons[\"Senior\"]",".buttons[\"Senior\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        [app.staticTexts["First Proposition"],
         app.staticTexts["First Opposition"],
         app.staticTexts["Second Proposition"],
         app.staticTexts["Second Opposition"],
         app.staticTexts["First Opposition"],
         app.staticTexts["First Proposition"],
         app.staticTexts["8:00"],
         app.staticTexts["8:00"],
         app.staticTexts["8:00"],
         app.staticTexts["8:00"],
         app.staticTexts["4:00"],
         app.staticTexts["4:00"]].forEach { XCTAssert($0.exists) }
        
        app.buttons["Junior"].tap()
        [app.staticTexts["First Proposition"],
         app.staticTexts["First Opposition"],
         app.staticTexts["Second Proposition"],
         app.staticTexts["Second Opposition"],
         app.staticTexts["First Opposition"],
         app.staticTexts["First Proposition"],
         app.staticTexts["6:00"],
         app.staticTexts["6:00"],
         app.staticTexts["6:00"],
         app.staticTexts["6:00"],
         app.staticTexts["3:00"],
         app.staticTexts["3:00"]].forEach { XCTAssert($0.exists) }
        
        app.buttons["Done"].tap()
        let nextButton = app.buttons["Next"]
        XCTAssertEqual(startButton.isEnabled, true)
        [pauseButton,
         resetButton].forEach { XCTAssertEqual($0.isEnabled, false) }

        app.buttons["Start"].tap()
        [startButton,
         resetButton].forEach { XCTAssertEqual($0.isEnabled, false) }

        pauseButton.tap()
        XCTAssertEqual(startButton.isEnabled, false)
        [resumeButton,
         resetButton,
         nextButton].forEach { XCTAssertEqual($0.isEnabled, true) }
        XCTAssertEqual(nextButton.isHittable, true)

        app.buttons["Reset"].tap()
        XCTAssertEqual(startButton.isEnabled, true)
        [pauseButton,
         resetButton].forEach { XCTAssertEqual($0.isEnabled, false) }
        
        startButton.tap()
        pauseButton.tap()
        nextButton.tap()
        XCTAssert(app.staticTexts["First Opposition"].exists)
        [pauseButton,
         resetButton].forEach { XCTAssertEqual($0.isEnabled, false) }
        
        
        app.navigationBars["Full Debate Timer"].buttons["Exit"].tap()
        
        app.buttons["Format Information"].tap()
        app.navigationBars["Format Information"].buttons["Back"].tap()
        
        let infoButton = app.otherElements.containing(.navigationBar, identifier:"NWSS Debate").children(matching: .button).element(boundBy: 3)
        infoButton.tap()
        app.navigationBars.buttons["Back"].tap()

        
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
