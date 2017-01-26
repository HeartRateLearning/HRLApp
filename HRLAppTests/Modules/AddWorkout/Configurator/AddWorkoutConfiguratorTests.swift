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

class AddWorkoutModuleConfiguratorTests: XCTestCase {

    // MARK: - Tests

    func testConfigureModuleForViewController() {
        // given
        let viewController = AddWorkoutViewController()
        let configurator = AddWorkoutModuleConfigurator()

        // when
        configurator.configureModule(for: viewController)

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

        let router = presenter.router as! AddWorkoutRouter
        XCTAssertNotNil(router.viewController)
    }
}
