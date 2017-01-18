//
//  ListWorkoutsListWorkoutsRouterTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

class ListWorkoutsRouterTests: XCTestCase {

    // MARK: - ListWorkoutsViewControllerTestDouble definition

    class ListWorkoutsViewControllerTestDouble: ListWorkoutsViewController {

        // MARK: - Public properties

        private (set) var lastSegue = ""
        private (set) var performSegueCount = 0

        // MARK: - Overrided methods

        override func performSegue(withIdentifier identifier: String, sender: Any?) {
            lastSegue = identifier
            performSegueCount += 1
        }
    }

    // MARK: - Properties

    let viewController = ListWorkoutsViewControllerTestDouble()

    let sut = ListWorkoutsRouter()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        sut.viewController = viewController
    }

    // MARK: - Tests

    func test_presentAddWorkout_performExpectedSegue() {
        // when
        sut.presentAddWorkout()

        // then
        XCTAssertEqual(viewController.performSegueCount, 1)
        XCTAssertEqual(viewController.lastSegue, ListWorkoutsRouter.Segues.addWorkout)
    }
}
