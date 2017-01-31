//
//  ListWorkoutDatesListWorkoutDatesConfiguratorTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 30/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

class ListWorkoutDatesModuleConfiguratorTests: XCTestCase {

    // MARK: - Properties

    let moduleInput = ListWorkoutDatesModuleInputTestDouble()
    let viewController = ListWorkoutDatesViewController()

    let sut = ListWorkoutDatesModuleConfigurator()

    // MARK: - Tests

    func test_configureDependenciesForViewController_setAllDependencies() {
        // when
        sut.configureDependencies(for: viewController)

        // then
        XCTAssertNotNil(viewController.output)

        let presenter = viewController.output as! ListWorkoutDatesPresenter
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.router)
        XCTAssertNotNil(presenter.interactor)

        let interactor = presenter.interactor as! GetWorkoutDatesInteractor
        XCTAssertNotNil(interactor.output)
        XCTAssertNotNil(interactor.store)
    }

    func test_configureModuleForViewController_configureModuleInput() {
        // given
        let anyIndex = 10

        viewController.output = moduleInput

        // when
        sut.configureModule(for: viewController, withWorkoutAt: anyIndex)

        // then
        XCTAssertEqual(moduleInput.configureCount, 1)
        XCTAssertEqual(moduleInput.lastWorkoutIndex, anyIndex)
    }
}
