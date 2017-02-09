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
    var anyTrainingData: [TrainerProtocol.TrainingTuple]!

    let factory = HRLClassifierFactoryTestDouble()
    let classifier = HRLClassifierTestDouble()

    var sut: Classifier!

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        factory.makeClassifierResult = classifier

        sut = Classifier(factory: factory)

        anyTrainingData = [(record: anyRecord, workingOut: anyWorkingOut)]
    }

    // MARK: - Tests

    func testAnyTrainingData_fit_tryToMakeANewClassifier() {
        // when
        sut.fit(trainingData: anyTrainingData)

        // then
        XCTAssertEqual(factory.makeClassifierCount, 1)
    }

    func testFittedClassifier_predictedWorkingOut_forwardToHRLClassifier() {
        // given
        sut.fit(trainingData: anyTrainingData)

        // when
        _ = sut.predictedWorkingOut(for: anyRecord)

        // then
        XCTAssertEqual(classifier.predictedWorkingOutCount, 1)
    }

    func testAnyData_setupWithMemento_factoryDoesNotMakeClassifier() {
        // given
        let memento = Data()

        // when
        sut.setup(withMemento: memento)

        // then
        XCTAssertEqual(factory.makeClassifierCount, 0)
    }

    func testMemento_setupWithMemento_factoryMakeClassifier() {
        // given
        let memento = sut.makeMemento()

        // when
        sut.setup(withMemento: memento)

        // then
        XCTAssertEqual(factory.makeClassifierCount, 1)
    }
}
