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

    let anyWorkoutIndex = 10
    let anyDateIndex = 20
    let anyWorkingOuts = [true]

    let view = ListHeartRatesViewInputTestDouble()
    let router = ListHeartRatesRouterInputTestDouble()
    let getHeartRates = GetHeartRatesInteractorInputTestDouble()
    let saveWorkingOuts = SaveWorkingOutsInteractorInputTestDouble()

    let sut = ListHeartRatesPresenter()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        sut.view = view
        sut.router = router
        sut.getHeartRates = getHeartRates
        sut.saveWorkingOuts = saveWorkingOuts
    }

    // MARK: - Tests

    func testAnyIndexes_configure_forwardToInteractor() {
        // when
        sut.configure(withWorkoutAt: anyWorkoutIndex, dateAt: anyDateIndex)

        // then
        XCTAssertEqual(getHeartRates.executeCount, 1)
        XCTAssertEqual(getHeartRates.lastWorkoutIndex, anyWorkoutIndex)
        XCTAssertEqual(getHeartRates.lastDateIndex, anyDateIndex)
    }

    func testAnyHeartRateRecords_interactorDidFindHeartRates_forwardToView() {
        // given
        let anyRecord = FoundHeartRateRecord(date: Date(), bpm: Float(60), workingOut: false)
        let anyRecords = [anyRecord]

        // when
        sut.interactor(getHeartRates, didFindHeartRates: anyRecords)

        // then
        XCTAssertEqual(view.setupCount, 1)
        XCTAssertEqual(view.lastRecords!, anyRecords)
    }

    func testConfiguredSut_save_forwardToInteractor() {
        // given
        sut.configure(withWorkoutAt: anyWorkoutIndex, dateAt: anyDateIndex)

        // when
        sut.save(workingOuts: anyWorkingOuts)

        // then
        XCTAssertEqual(saveWorkingOuts.executeCount, 1)
        XCTAssertEqual(saveWorkingOuts.lastWorkoutIndex, anyWorkoutIndex)
        XCTAssertEqual(saveWorkingOuts.lastDateIndex, anyDateIndex)
        XCTAssertEqual(saveWorkingOuts.lastWorkingOuts!, anyWorkingOuts)
    }

    func test_interactorDidSaveWorkingOuts_forwardToRouter() {
        // when
        sut.interactorDidSaveWorkingOuts(saveWorkingOuts)

        // then
        XCTAssertEqual(router.presentWorkoutDateListCount, 1)
    }
}
