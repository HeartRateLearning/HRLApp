//
//  ListWorkoutsListWorkoutsViewTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

final class ListWorkoutsViewTests: XCTestCase {
    
    // MARK: - Properties

    let output = ListWorkoutsViewOutputTestDouble()

    var sut: ListWorkoutsViewController!

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        let instantiater = ViewControllerInstantiaterHelper()
        let viewController = instantiater.viewController(with: Constants.viewControllerId)

        sut = viewController as! ListWorkoutsViewController
        sut.output = output
    }

    // MARK: - Tests

    func test_add_forwardToOuput() {
        // when
        sut.add("")

        // then
        XCTAssertEqual(output.addCount, 1)
    }

    func test_tableViewDidSelectSecondRow_forwardToOutput() {
        // when
        let row = 1
        let section = 0
        let indexPath = IndexPath(row: row, section: section)

        sut.tableView(sut.tableView, didSelectRowAt: indexPath)

        // then
        XCTAssertEqual(output.didSelectWorkoutCount, 1)
        XCTAssertEqual(output.lastSelectedWorkoutIndex, row)
    }
}

// MARK: - Private body

private extension ListWorkoutsViewTests {
    enum Constants {
        static let viewControllerId = "ListWorkoutsViewController"
    }
}
