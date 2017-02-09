//
//  ClassifierTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 08/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import HRLClassifier
import XCTest

@testable import HRLApp

// MARK: - Main body

final class ClassifierTests: XCTestCase {

    // MARK: - Properties

    let anyRecord = HeartRateRecord(date: Date(), bpm: Float(60))
    let anyWorkingOut = false
    var anyTrainingData: [Trainable.TrainingTuple]!

    let factory = HRLClassifierFactoryTestDouble()
    let classifier = HRLClassifierTestDouble()
    let dataFrameStore = DataFramePersistentStoreTestDouble()

    var sut: Classifier!

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        factory.makeClassifierResult = classifier

        sut = Classifier(factory: factory, dataFrameStore: dataFrameStore)

        let tuple = (record: anyRecord, workingOut: anyWorkingOut) as Trainable.TrainingTuple
        anyTrainingData = [tuple, tuple, tuple]
    }

    // MARK: - Tests

    func testNonEmptyPersistedDataFrameAndAnyTrainingData_fit_persistedDataFrameIsUpdated() {
        // given
        dataFrameStore.readResult = makeNonEmptyDataFrame()

        // when
        sut.fit(trainingData: anyTrainingData)

        // then
        let expectedDataFrame = makeNonEmptyDataFrame(plus: anyTrainingData)

        XCTAssertEqual(dataFrameStore.readCount, 1)
        XCTAssertEqual(dataFrameStore.writeCount, 1)
        XCTAssertEqual(dataFrameStore.lastWriteDataFrame, expectedDataFrame)
    }

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
}

// MARK: - Private body

private extension ClassifierTests {
    func makeNonEmptyDataFrame(plus data: [Trainable.TrainingTuple] = []) -> DataFrame {
        let dataFrame = DataFrame()

        let record = HRLClassifier.Record(date: anyRecord.date, bpm: anyRecord.bpm)
        dataFrame.append(record: record, isWorkingOut: anyWorkingOut)

        for (record, workingOut) in data {
            let hrlRecord = HRLClassifier.Record(date: record.date, bpm: record.bpm)

            dataFrame.append(record: hrlRecord, isWorkingOut: workingOut)
        }

        return dataFrame
    }
}
