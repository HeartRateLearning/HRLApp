//
//  DataFramePersistentStoreTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 09/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation
import HRLClassifier

@testable import HRLApp

// MARK: - Main body

class DataFramePersistentStoreTestDouble {

    // MARK: - Public properties

    fileprivate (set) var readCount = 0
    fileprivate (set) var writeCount = 0

    fileprivate (set) var lastWriteDataFrame: DataFrame?

    var readResult = DataFrame()
}

// MARK: - DataFramePersistentStoreProtocol methods

extension DataFramePersistentStoreTestDouble: DataFramePersistentStoreProtocol {
    func read() -> DataFrame {
        readCount += 1

        return readResult
    }

    func write(_ dataFrame: DataFrame) {
        writeCount += 1

        lastWriteDataFrame = dataFrame
    }
}
