//
//  SetupSetupPresenterTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 15/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

class SetupPresenterTest: XCTestCase {

    // MARK: - Properties

    let view = SetupViewInputTestDouble()
    let router = SetupRouterInputTestDouble()
    let interactor = SetupInteractorInputTestDouble()

    let sut = SetupPresenter()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        sut.view = view
        sut.router = router
        sut.interactor = interactor
    }

    // MARK: - Tests

    func test_viewIsReady_forwardToInteractor() {
        // when
        sut.viewIsReady()

        // then
        XCTAssertEqual(interactor.executeCount, 1)
    }

    func test_interactorDidPerformSetup_forwardToRouter() {
        // when
        sut.interactorDidPerformSetup(interactor)

        // then
        XCTAssertEqual(router.presentWorkoutListCount, 1)
    }
}
