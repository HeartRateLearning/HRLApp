//
//  AddWorkoutAddWorkoutRouterTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

class AddWorkoutRouterTests: XCTestCase {

    // MARK: - AddWorkoutViewControllerTestDouble definition

    class AddWorkoutViewControllerTestDouble: AddWorkoutViewController {

        // MARK: - Public properties

        var otherNavigationController: UINavigationController?

        // MARK: - Overrided properties

        override var navigationController: UINavigationController? {
            set {
                otherNavigationController = newValue
            }
            get {
                return otherNavigationController
            }
        }
    }

    // MARK: - UINavigationControllerTestDouble definition

    class UINavigationControllerTestDouble: UINavigationController {

        // MARK: - Public properties

        private (set) var popViewControllerCount = 0

        // MARK: - Overrided methods

        override func popViewController(animated: Bool) -> UIViewController? {
            popViewControllerCount += 1

            return nil
        }
    }

    // MARK: - Properties

    let addWorkoutViewController = AddWorkoutViewControllerTestDouble()
    let navigationController = UINavigationControllerTestDouble()

    let sut = AddWorkoutRouter()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        sut.viewController = addWorkoutViewController
        addWorkoutViewController.navigationController = navigationController
    }

    // MARK: - Tests

    func test_presentWorkoutList_popViewController() {
        // when
        sut.presentWorkoutList()

        // then
        XCTAssertEqual(navigationController.popViewControllerCount, 1)
    }
}
