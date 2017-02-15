//
//  SetupSetupConfiguratorTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 15/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

class SetupModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = SetupViewControllerMock()
        let configurator = SetupModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "SetupViewController is nil after configuration")
        XCTAssertTrue(viewController.output is SetupPresenter, "output is not SetupPresenter")

        let presenter: SetupPresenter = viewController.output as! SetupPresenter
        XCTAssertNotNil(presenter.view, "view in SetupPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in SetupPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is SetupRouter, "router is not SetupRouter")

        let interactor: SetupInteractor = presenter.interactor as! SetupInteractor
        XCTAssertNotNil(interactor.output, "output in SetupInteractor is nil after configuration")
    }

    class SetupViewControllerMock: SetupViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
