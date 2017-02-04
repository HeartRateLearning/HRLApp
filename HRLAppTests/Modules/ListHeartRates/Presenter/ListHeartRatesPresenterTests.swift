//
//  ListHeartRatesListHeartRatesPresenterTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

class ListHeartRatesPresenterTest: XCTestCase {

    // MARK: - Properties

    let view = ListHeartRatesViewInputTestDouble()
    let router = ListHeartRatesRouter()
    let interactor = GetHeartRatesInteractorInputTestDouble()

    let sut = ListHeartRatesPresenter()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        sut.view = view
        sut.router = router
        sut.interactor = interactor
    }

    // MARK: - Tests

    func testAnyIndexes_configure_forwardToInteractor() {
        // given
        let anyWorkoutIndex = 10
        let anyDateIndex = 20

        // when
        sut.configure(withWorkoutAt: anyWorkoutIndex, dateAt: anyDateIndex)

        // then
        XCTAssertEqual(interactor.executeCount, 1)
        XCTAssertEqual(interactor.lastWorkoutIndex, anyWorkoutIndex)
        XCTAssertEqual(interactor.lastDateIndex, anyDateIndex)
    }

    func testAnyHeartRateRecords_interactorDidFindHeartRates_forwardToView() {
        // given
        let anyRecords = [HeartRateRecord(date: Date(), bpm: Float(60))]

        // when
        sut.interactor(interactor, didFindHeartRates: anyRecords)

        // then
        XCTAssertEqual(view.setupCount, 1)
        XCTAssertEqual(view.lastRecords!, anyRecords)
    }
}
