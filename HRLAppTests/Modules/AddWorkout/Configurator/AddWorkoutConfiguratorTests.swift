//
//  AddWorkoutAddWorkoutConfiguratorTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

class AddWorkoutModuleConfiguratorTests: XCTestCase {

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
        let viewController = AddWorkoutViewControllerMock()
        let configurator = AddWorkoutModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "AddWorkoutViewController is nil after configuration")
        XCTAssertTrue(viewController.output is AddWorkoutPresenter, "output is not AddWorkoutPresenter")

        let presenter: AddWorkoutPresenter = viewController.output as! AddWorkoutPresenter
        XCTAssertNotNil(presenter.view, "view in AddWorkoutPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in AddWorkoutPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is AddWorkoutRouter, "router is not AddWorkoutRouter")

        let interactor: AddWorkoutInteractor = presenter.interactor as! AddWorkoutInteractor
        XCTAssertNotNil(interactor.output, "output in AddWorkoutInteractor is nil after configuration")
    }

    class AddWorkoutViewControllerMock: AddWorkoutViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
