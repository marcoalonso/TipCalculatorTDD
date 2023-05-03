//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by Marco Alonso Rodriguez on 02/05/23.
//

import XCTest

 class when_content_view_is_shown: XCTestCase {
     
     private var app: XCUIApplication!
     
     private var contentViewPage: ContentViewPage!
     
     override func setUp() {
         app = XCUIApplication()
         contentViewPage = ContentViewPage(app: app)
         
         continueAfterFailure = false
         app.launch()
     }

     func test_should_make_sure_that_the_total_text_field_contains_default_value(){
         
//         let totalTextField = app.textFields["totalTextField"]
         XCTAssertEqual(contentViewPage.totalTextField.value as! String, "Enter total")
     }
     
     func test_should_make_sure_the_15_percent_default_tip_option_is_selected() {

//         let tipPercentageSegmentedControl = app.segmentedControls["tipPercentageSegmentedControl"]
         let segmentedControlButton = contentViewPage.tipPercentageSegmentedControl.buttons.element(boundBy: 2)
         
         XCTAssertEqual(segmentedControlButton.label, "15%") ///- Label has 15% text
         XCTAssertTrue(segmentedControlButton.isSelected) ///- We can validate other properties
         XCTAssertTrue(segmentedControlButton.isEnabled)
     }
   
     ///*- After each test run *
     override func tearDown() {
         //Clean up
     }
}

class whenCalculateTipButtonIsPressedForValidInput: XCTestCase {
    
    private var contentViewPage: ContentViewPage!
    
    private var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        
        continueAfterFailure = false
        app.launch()
        
        let totalTextField = contentViewPage.totalTextField
        
        totalTextField.tap()
        totalTextField.typeText("100")
    }
    
    func testShouldMakeSureThatTipIsDisplayedOnTheScreen(){
        
        let calculateTipButton = contentViewPage.calculateTipButton
        
        calculateTipButton.tap()
        
        let tipText = contentViewPage.tipText
        let _ = tipText.waitForExistence(timeout: 0.5)
        XCTAssertEqual(tipText.label, "$15.00")
        
    }
    
    
}

class when_calculate_tip_button_is_pressed_for_invalid_input: XCTestCase {
    
    private var app: XCUIApplication!
    private var contentViewPage: ContentViewPage!
    
    override func setUp() {
        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        
        continueAfterFailure = false
        app.launch()
        
        ///- * Page Object Pattern
        
        let totalTextField = app.textFields["totalTextField"]
        totalTextField.tap()
        totalTextField.typeText("-100")
    }
    
    func test_should_clear_tip_label_for_invalid_input(){
        
        let calculateTipButton = app.buttons["calculateTipButton"]
        calculateTipButton.tap()
        
        let tipText = app.staticTexts["tipText"]
        let _ = tipText.waitForExistence(timeout: 0.5)
        
        XCTAssertEqual(tipText.label, "")
    }
    
    func test_should_display_error_message_for_invalid_input(){
        
        let calculateTipButton = app.buttons["calculateTipButton"]
        calculateTipButton.tap()
        
        let messageText = app.staticTexts["messageText"]
        let _ = messageText.waitForExistence(timeout: 0.5)
        
        XCTAssertEqual(messageText.label, "Invalid Input")
        
    }
}
