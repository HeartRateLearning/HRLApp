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
