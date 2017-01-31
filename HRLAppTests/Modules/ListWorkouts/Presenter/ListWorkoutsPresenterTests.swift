//
//  ListWorkoutsListWorkoutsPresenterTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

class ListWorkoutsPresenterTest: XCTestCase {

    // MARK: - Properties

    let view = ListWorkoutsViewInputTestDouble()
    let router = ListWorkoutsRouterInputTestDouble()
    let interactor = GetStoredWorkoutsInteractorInputTestDouble()

    let sut = ListWorkoutsPresenter()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        sut.view = view
        sut.router = router
        sut.interactor = interactor
    }

    // MARK: - Tests

    func test_viewIsReady_forwardToInteractor() {
        // when
        sut.viewIsReady()

        // then
        XCTAssertEqual(interactor.executeCount, 1)
    }

    func test_add_forwardToRouter() {
        // when
        sut.add()

        // then
        XCTAssertEqual(router.presentAddWorkoutCount, 1)
    }

    func testAnyIndex_didSelectWorkoutAtIndex_forwardToRouter() {
        // given
        let anyIndex = 10

        // when
        sut.didSelectWorkout(at: anyIndex)

        // then
        XCTAssertEqual(router.presentDataListCount, 1)
        XCTAssertEqual(router.lastDataListWorkoutIndex, anyIndex)
    }

    func testAnyWorkouts_interactorDidFindWorkouts_setupView() {
        // given
        let anyWorkouts = ["Workout 01", "Workout 02"]

        // when
        sut.interactor(interactor, didFindWorkouts: anyWorkouts)

        // then
        XCTAssertEqual(view.setupCount, 1)
        XCTAssertEqual(view.lastWorkouts!, anyWorkouts)
    }
}
