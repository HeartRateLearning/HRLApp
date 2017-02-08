//
//  ListWorkoutDatesViewTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

final class ListWorkoutDatesViewTests: XCTestCase {

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

    func test_tableViewDidSelectSecondRow_forwardToOutput() {
        // when
        let row = 1
        let section = 0
        let indexPath = IndexPath(row: row, section: section)

        sut.tableView(sut.tableView, didSelectRowAt: indexPath)

        // then
        XCTAssertEqual(output.didSelectDateCount, 1)
        XCTAssertEqual(output.lastSelectedDateIndex, row)
    }
}

// MARK: - Private body

private extension ListWorkoutDatesViewTests {
    enum Constants {
        static let viewControllerId = "ListWorkoutDatesViewController"
    }
}
