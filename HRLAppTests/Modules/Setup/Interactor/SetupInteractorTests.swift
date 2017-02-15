//
//  SetupSetupInteractorTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 15/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

class SetupInteractorTests: XCTestCase {

    // MARK: - Properties

    let output = SetupInteractorOutputTestDouble()
    let coreDataStore = CoreDataConfigurableTestDouble()
    let healthStoreFactory = HealthStoreFactoryTestDouble()

    var sut = SetupInteractor()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        sut.output = output
        sut.coreDataStore = coreDataStore
        sut.healthStoreFactory = healthStoreFactory
    }

    // MARK: - Tests

    func test_execute_setupStoragesAndForwardToSetup() {
        // when
        sut.execute()

        // then
        XCTAssertEqual(coreDataStore.setupCount, 1)
        XCTAssertEqual(healthStoreFactory.setupCount, 1)
        XCTAssertEqual(output.didPerformSetupCount, 1)
    }
}
