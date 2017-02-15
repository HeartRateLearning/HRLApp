//
//  AddWorkoutAddWorkoutConfiguratorTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

final class AddWorkoutModuleConfiguratorTests: XCTestCase {

    // MARK: - Properties

    let store = WorkoutStoreTestDouble()
    let viewController = AddWorkoutViewController()

    let sut = AddWorkoutModuleConfigurator()

    // MARK: - Tests

    func test_configureDependenciesForViewController_setAllDependencies() {
        // when
        sut.configureDependencies(for: viewController, with: store)

        // then
        XCTAssertNotNil(viewController.output)

        let presenter = viewController.output as! AddWorkoutPresenter
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.router)
        XCTAssertNotNil(presenter.getAllWorkouts)
        XCTAssertNotNil(presenter.storeWorkout)

        let getAllWorkouts = presenter.getAllWorkouts as! GetAllWorkoutsInteractor
        XCTAssertNotNil(getAllWorkouts.output)

        let storeWorkout = presenter.storeWorkout as! StoreWorkoutInteractor
        XCTAssertNotNil(storeWorkout.store)
        XCTAssertNotNil(storeWorkout.output)
    }
}
