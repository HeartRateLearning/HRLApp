//
//  ListHeartRatesListHeartRatesConfiguratorTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

class ListHeartRatesModuleConfiguratorTests: XCTestCase {

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
        let viewController = ListHeartRatesViewControllerMock()
        let configurator = ListHeartRatesModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "ListHeartRatesViewController is nil after configuration")
        XCTAssertTrue(viewController.output is ListHeartRatesPresenter, "output is not ListHeartRatesPresenter")

        let presenter: ListHeartRatesPresenter = viewController.output as! ListHeartRatesPresenter
        XCTAssertNotNil(presenter.view, "view in ListHeartRatesPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in ListHeartRatesPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is ListHeartRatesRouter, "router is not ListHeartRatesRouter")

        let interactor: ListHeartRatesInteractor = presenter.interactor as! ListHeartRatesInteractor
        XCTAssertNotNil(interactor.output, "output in ListHeartRatesInteractor is nil after configuration")
    }

    class ListHeartRatesViewControllerMock: ListHeartRatesViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
