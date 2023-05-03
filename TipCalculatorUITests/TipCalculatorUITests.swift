//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by Marco Alonso Rodriguez on 02/05/23.
//

import XCTest

 class when_content_view_is_shown: XCTestCase {

     func test_should_make_sure_that_the_total_text_field_contains_default_value(){
         
         let app = XCUIApplication()
         continueAfterFailure = false
         app.launch()
         
         let totalTextField = app.textFields["totalTextField"]
         
         XCTAssertEqual(totalTextField.value as! String, "Enter total")
     }
     
     func test_should_make_sure_the_15_percent_default_tip_option_is_selected() {
         let app = XCUIApplication()
         continueAfterFailure = false
         app.launch()
         
         let tipPercentageSegmentedControl = app.segmentedControls["tipPercentageSegmentedControl"]
         let segmentedControlButton = tipPercentageSegmentedControl.buttons.element(boundBy: 2)
         
         XCTAssertEqual(segmentedControlButton.label, "15%") ///- Label has 15% text
         XCTAssertTrue(segmentedControlButton.isSelected) ///- We can validate other properties
         XCTAssertTrue(segmentedControlButton.isEnabled)
     }
   
}
