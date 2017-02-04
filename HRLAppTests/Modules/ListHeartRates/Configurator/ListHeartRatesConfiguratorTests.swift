//
//  ListHeartRatesListHeartRatesConfiguratorTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

class ListHeartRatesModuleConfiguratorTests: XCTestCase {

    // MARK: - Properties

    let factory = HealthStoreFactoryTestDouble()
    let workoutStore = WorkoutStoreTestDouble()
    let heartRateStore = HeartRateStoreTestDouble()
    let moduleInput = ListHeartRatesModuleInputTestDouble()
    let viewController = ListHeartRatesViewController()

    var sut: ListHeartRatesModuleConfigurator!

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        factory.makeHeartRateStoreResult = heartRateStore
        
        sut = ListHeartRatesModuleConfigurator(store: workoutStore, factory: factory)
    }

    // MARK: - Tests

    func test_configureDependenciesForViewController_setAllDependencies() {
        // when
        sut.configureDependencies(for: viewController)

        // then
        XCTAssertNotNil(viewController.output)

        let presenter = viewController.output as! ListHeartRatesPresenter
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.router)
        XCTAssertNotNil(presenter.interactor)

        let interactor = presenter.interactor as! GetHeartRatesInteractor
        XCTAssertNotNil(interactor.workoutStore)
        XCTAssertNotNil(interactor.heartRateStore)
        XCTAssertTrue(interactor.output === presenter)
    }

    func test_configureModuleForViewController_configureModuleInput() {
        // given
        let anyWorkoutIndex = 10
        let anyDateIndex = 20

        viewController.output = moduleInput

        // when
        sut.configureModule(for: viewController,
                            withWorkoutAt: anyWorkoutIndex,
                            dateAt: anyDateIndex)

        // then
        XCTAssertEqual(moduleInput.configureCount, 1)
        XCTAssertEqual(moduleInput.lastWorkoutIndex, anyWorkoutIndex)
        XCTAssertEqual(moduleInput.lastDateIndex, anyDateIndex)
    }
}
