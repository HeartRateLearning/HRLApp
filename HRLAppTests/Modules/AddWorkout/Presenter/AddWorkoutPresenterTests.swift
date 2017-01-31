//
//  AddWorkoutAddWorkoutPresenterTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

class AddWorkoutPresenterTest: XCTestCase {

    // MARK: - Properties

    let anyDate = Date()
    let anyIndex = 11
    let workouts = ["Workout 01", "Workout 02"]

    let view = AddWorkoutViewInputTestDouble()
    let router = AddWorkoutRouterInputTestDouble()
    let getAllWorkouts = GetAllWorkoutsInteractorInputTestDouble()
    let storeWorkout = StoreWorkoutInteractorInputTestDouble()

    let sut = AddWorkoutPresenter()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        sut.view = view
        sut.router = router
        sut.getAllWorkouts = getAllWorkouts
        sut.storeWorkout = storeWorkout
    }

    // MARK: - Tests

    func test_viewIsReady_forwardToInteractor() {
        // when
        sut.viewIsReady()

        // then
        XCTAssertEqual(getAllWorkouts.executeCount, 1)
    }

    func testAnyIndexAndAnyDate_addWorkout_forwardToInteractor() {
        // when
        sut.addWorkout(at: anyIndex, startingOn: anyDate)

        // then
        XCTAssertEqual(storeWorkout.executeCount, 1)
        XCTAssertEqual(storeWorkout.lastWorkoutIndex, anyIndex)
        XCTAssertEqual(storeWorkout.lastDate, anyDate)
    }

    func test_didFindWorkouts_setupInitialStateInView() {
        // when
        sut.interactor(getAllWorkouts, didFindWorkouts: workouts)

        // then
        XCTAssertEqual(view.setupCount, 1)
        XCTAssertEqual(view.lastWorkouts!, workouts)
    }

    func test_didStoreWorkout_forwardToRouter() {
        // when
        sut.interactor(storeWorkout, didStoreWorkout: workouts[0])

        // then
        XCTAssertEqual(router.presentWorkoutListCount, 1)
    }
}
