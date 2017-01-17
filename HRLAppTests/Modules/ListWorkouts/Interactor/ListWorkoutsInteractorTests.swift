//
//  ListWorkoutsListWorkoutsInteractorTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

class ListWorkoutsInteractorTests: XCTestCase {

    // MARK: - Properties

    let store = WorkoutStoreTestDouble()
    let output = ListWorkoutsInteractorOutputTestDouble()

    let sut = ListWorkoutsInteractor()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        sut.store = store
        sut.output = output
    }

    // MARK: - Tests

    func test_execute_requestWorkoutsAndForwardToOuptut() {
        // when
        sut.execute()

        // then
        XCTAssertEqual(store.workoutsCount, 1)
        XCTAssertEqual(output.foundWorkoutsCount, 1)
    }
}
