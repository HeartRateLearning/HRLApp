//
//  ListWorkoutDatesListWorkoutDatesPresenterTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 30/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

final class ListWorkoutDatesPresenterTest: XCTestCase {

    // MARK: - Properties

    let view = ListWorkoutDatesViewInputTestDouble()
    let router = ListWorkoutDatesRouterInputTestDouble()
    let interactor = GetWorkoutDatesInteractorInputTestDouble()

    let sut = ListWorkoutDatesPresenter()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        sut.view = view
        sut.router = router
        sut.interactor = interactor
    }

    // MARK: - Tests

    func testAnyWorkoutIndex_configureWithWorkoutIndex_forwardToInteractor() {
        // given
        let anyWorkoutIndex = 10

        // when
        sut.configure(withWorkoutAt: anyWorkoutIndex)

        // then
        XCTAssertEqual(interactor.executeCount, 1)
        XCTAssertEqual(interactor.lastWorkoutIndex, anyWorkoutIndex)
    }

    func testAnyDates_interactorDidFindWorkoutDates_forwardToView() {
        // given
        let anyDates = [Date(), Date()]

        // when
        sut.interactor(interactor, didFindWorkoutDates: anyDates)

        // then
        XCTAssertEqual(view.setupCount, 1)
        XCTAssertEqual(view.lastDates!, anyDates)
    }
}
