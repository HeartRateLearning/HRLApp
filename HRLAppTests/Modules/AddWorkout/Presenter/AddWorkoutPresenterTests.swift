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

    let workouts = ["Workout 01", "Workout 02"]

    let view = AddWorkoutViewInputTestDouble()
    let router = AddWorkoutRouter()
    let interactor = GetAllWorkoutsInteractorInputTestDouble()

    let sut = AddWorkoutPresenter()

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

    func test_didFindWorkouts_setupInitialStateInView() {
        // when
        sut.interactor(interactor, didFindWorkouts: workouts)

        // then
        XCTAssertEqual(view.setupInitialStateCount, 1)
    }

    func testSutWithWorkouts_numberOfWorkouts_returnExpectedCount() {
        // given
        sut.interactor(interactor, didFindWorkouts: workouts)

        // when
        let count = sut.numberOfWorkouts()

        // then
        XCTAssertEqual(count, workouts.count)
    }

    func testSutWithWorkouts_workoutAtLastIndex_returnExpectedWorkout() {
        // given
        sut.interactor(interactor, didFindWorkouts: workouts)

        // when
        let index = workouts.count - 1
        let lastWorkout = sut.workout(at: index)
        
        // then
        XCTAssertEqual(workouts[index], lastWorkout)
    }
}
