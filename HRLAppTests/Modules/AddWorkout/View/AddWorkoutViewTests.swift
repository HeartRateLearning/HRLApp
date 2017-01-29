//
//  AddWorkoutViewTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

class AddWorkoutViewTests: XCTestCase {

    // MARK: - Properties

    let output = AddWorkoutViewOutputTestDouble()

    var sut: AddWorkoutViewController!

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        let instantiater = ViewControllerInstantiaterHelper()
        let viewController = instantiater.viewController(with: Constants.viewControllerId)
        viewController.view.reloadInputViews()

        sut = viewController as! AddWorkoutViewController
        sut.output = output
    }

    // MARK: - Tests

    func test_pickerViewNumberOfRowsInComponent_forwardToOutput() {
        // when
        let component = 0

        _ = sut.pickerView(sut.workoutPicker, numberOfRowsInComponent: component)

        // then
        XCTAssertEqual(output.numberOfWorkoutsCount, 1)
    }

    func testOutputWithTwoWorkouts_pickerViewTitleForSecondRow_forwardToOutput() {
        // given
        output.numberOfWorkoutsResult = 2

        // when
        let row = 1
        let component = 0

        _ = sut.pickerView(sut.workoutPicker, titleForRow: row, forComponent: component)

        // then
        XCTAssertEqual(output.workoutAtIndexCount, 1)
        XCTAssertEqual(output.lastWorkoutIndex, row)
    }

    func test_done_forwardToOutput() {
        // when
        sut.done("")

        // then
        XCTAssertEqual(output.addWorkoutCount, 1)
    }
}

// MARK: - Private body

private extension AddWorkoutViewTests {
    enum Constants {
        static let viewControllerId = "AddWorkoutViewController"
    }
}
