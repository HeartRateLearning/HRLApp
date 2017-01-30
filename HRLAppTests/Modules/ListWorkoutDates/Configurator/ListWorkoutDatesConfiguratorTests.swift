//
//  ListWorkoutDatesListWorkoutDatesConfiguratorTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 30/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

class ListWorkoutDatesModuleConfiguratorTests: XCTestCase {

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
        let viewController = ListWorkoutDatesViewControllerMock()
        let configurator = ListWorkoutDatesModuleConfigurator()

        //when
        configurator.configureModule(for: viewController)

        //then
        XCTAssertNotNil(viewController.output, "ListWorkoutDatesViewController is nil after configuration")
        XCTAssertTrue(viewController.output is ListWorkoutDatesPresenter, "output is not ListWorkoutDatesPresenter")

        let presenter: ListWorkoutDatesPresenter = viewController.output as! ListWorkoutDatesPresenter
        XCTAssertNotNil(presenter.view, "view in ListWorkoutDatesPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in ListWorkoutDatesPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is ListWorkoutDatesRouter, "router is not ListWorkoutDatesRouter")

        let interactor: ListWorkoutDatesInteractor = presenter.interactor as! ListWorkoutDatesInteractor
        XCTAssertNotNil(interactor.output, "output in ListWorkoutDatesInteractor is nil after configuration")
    }

    class ListWorkoutDatesViewControllerMock: ListWorkoutDatesViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
