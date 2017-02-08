//
//  ClassifierTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 08/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

final class ClassifierTests: XCTestCase {

    // MARK: - Properties

    let anyRecord = HeartRateRecord(date: Date(), bpm: Float(60))
    let anyWorkingOut = false

    let factory = HRLClassifierFactoryTestDouble()
    let classifier = HRLClassifierTestDouble()

    var sut: Classifier!

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        factory.makeClassifierResult = classifier

        sut = Classifier(factory: factory)
    }

    // MARK: - Tests

    func testAnyRecordAndWorkingOut_fit_tryToMakeANewClassifier() {
        // when
        sut.fit(record: anyRecord, workingOut: anyWorkingOut)

        // then
        XCTAssertEqual(factory.makeClassifierCount, 1)
    }

    func testFittedClassifier_predictedWorkingOut_forwardToHRLClassifier() {
        // given
        sut.fit(record: anyRecord, workingOut: anyWorkingOut)

        // when
        _ = sut.predictedWorkingOut(for: anyRecord)

        // then
        XCTAssertEqual(classifier.predictedWorkingOutCount, 1)
    }
}
