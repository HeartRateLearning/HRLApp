//
//  ListWorkoutsListWorkoutsConfiguratorTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

class ListWorkoutsModuleConfiguratorTests: XCTestCase {

    // MARK: - Tests

    func testConfigureModuleForViewController() {
        // given
        let viewController = ListWorkoutsViewController()
        let configurator = ListWorkoutsModuleConfigurator()

        // when
        configurator.configureModuleForViewInput(viewInput: viewController)

        // then
        XCTAssertNotNil(viewController.output)

        let presenter = viewController.output as! ListWorkoutsPresenter
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.router)
        XCTAssertNotNil(presenter.interactor)

        let interactor = presenter.interactor as! ListWorkoutsInteractor
        XCTAssertNotNil(interactor.store)
        XCTAssertNotNil(interactor.output)

        let router = presenter.router as! ListWorkoutsRouter
        XCTAssertNotNil(router.viewController)
    }
}
