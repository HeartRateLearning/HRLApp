//
//  SetupSetupConfiguratorTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 15/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

class SetupModuleConfiguratorTests: XCTestCase {

    // MARK: - Tests

    func test_configureDependenciesForViewController_setAllDependencies() {
        // given
        let viewController = SetupViewController()
        let configurator = SetupModuleConfigurator()

        // when
        configurator.configureDependencies(for: viewController)

        // then
        XCTAssertNotNil(viewController.output)

        let presenter = viewController.output as! SetupPresenter
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.router)
        XCTAssertNotNil(presenter.interactor)

        let interactor = presenter.interactor as! SetupInteractor
        XCTAssertTrue(interactor.output === presenter)
    }
}
