//
//  ListWorkoutsListWorkoutsConfiguratorTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

class ListWorkoutsModuleConfiguratorTests: XCTestCase {

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
        let viewController = ListWorkoutsViewControllerMock()
        let configurator = ListWorkoutsModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "ListWorkoutsViewController is nil after configuration")
        XCTAssertTrue(viewController.output is ListWorkoutsPresenter, "output is not ListWorkoutsPresenter")

        let presenter: ListWorkoutsPresenter = viewController.output as! ListWorkoutsPresenter
        XCTAssertNotNil(presenter.view, "view in ListWorkoutsPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in ListWorkoutsPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is ListWorkoutsRouter, "router is not ListWorkoutsRouter")

        let interactor: ListWorkoutsInteractor = presenter.interactor as! ListWorkoutsInteractor
        XCTAssertNotNil(interactor.output, "output in ListWorkoutsInteractor is nil after configuration")
    }

    class ListWorkoutsViewControllerMock: ListWorkoutsViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
