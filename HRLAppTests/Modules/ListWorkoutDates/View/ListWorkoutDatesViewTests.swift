//
//  ListWorkoutDatesListWorkoutDatesViewTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 30/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

class ListWorkoutDatesViewTests: XCTestCase {

    // MARK: - Properties

    let output = ListWorkoutDatesViewOutputTestDouble()

    var sut: ListWorkoutDatesViewController!

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        let instantiater = ViewControllerInstantiaterHelper()
        let viewController = instantiater.viewController(with: Constants.viewControllerId)

        sut = viewController as! ListWorkoutDatesViewController
        sut.output = output
    }

    // MARK: - Tests

    func test_tableViewNumberOfRowsInSection_forwardToOutput() {
        // when
        let section = 0

        _ = sut.tableView(sut.tableView, numberOfRowsInSection: section)

        // then
        XCTAssertEqual(output.numberOfDatesCount, 1)
    }

    func testOutputWithTwoWorkouts_tableViewCellForSecondRow_forwardToOutput() {
        // given
        output.numberOfDatesResult = 2

        // when
        let row = 1
        let section = 0
        let indexPath = IndexPath(row: row, section: section)

        _ = sut.tableView(sut.tableView, cellForRowAt: indexPath)

        // then
        XCTAssertEqual(output.dateAtIndexCount, 1)
        XCTAssertEqual(output.lastDateIndex, row)
    }

    func testOutputWithWorkouts_setupInitialState_atLeastRequestNumberOfWorkouts() {
        // given
        output.numberOfDatesResult = 1

        // when
        sut.setupInitialState()

        // then
        XCTAssertEqual(output.numberOfDatesCount, 1)
    }
}

// MARK: - Private body

private extension ListWorkoutDatesViewTests {
    enum Constants {
        static let viewControllerId = "ListWorkoutDatesViewController"
    }
}
