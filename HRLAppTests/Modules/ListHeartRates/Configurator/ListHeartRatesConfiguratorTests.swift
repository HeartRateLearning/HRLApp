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

final class ListHeartRatesModuleConfiguratorTests: XCTestCase {

    // MARK: - Properties

    let factory = HealthStoreFactoryTestDouble()
    let workoutStore = WorkoutStoreTestDouble()
    let workoutWriter = WorkoutWriterTestDouble()
    let heartRateReader = HeartRateReaderTestDouble()
    let moduleInput = ListHeartRatesModuleInputTestDouble()
    let viewController = ListHeartRatesViewController()

    var sut = ListHeartRatesModuleConfigurator()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        factory.makeWorkoutWriterResult = workoutWriter
        factory.makeHeartRateReaderResult = heartRateReader
    }

    // MARK: - Tests

    func test_configureDependenciesForViewController_setAllDependencies() {
        // when
        sut.configureDependencies(for: viewController, withStore: workoutStore, factory: factory)

        // then
        XCTAssertNotNil(viewController.output)

        let presenter = viewController.output as! ListHeartRatesPresenter
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.router)
        XCTAssertNotNil(presenter.interactor)

        let getHeartRates = presenter.getHeartRates as! GetHeartRatesInteractor
        XCTAssertNotNil(getHeartRates.factory)
        XCTAssertNotNil(getHeartRates.workoutStore)
        XCTAssertNotNil(getHeartRates.heartRateReader)
        XCTAssertTrue(getHeartRates.output === presenter)

        let saveWorkingOuts = presenter.saveWorkingOuts as! SaveWorkingOutsInteractor
        XCTAssertNotNil(saveWorkingOuts.factory)
        XCTAssertNotNil(saveWorkingOuts.workoutStore)
        XCTAssertNotNil(saveWorkingOuts.workoutWriter)
        XCTAssertTrue(saveWorkingOuts.output === presenter)
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
