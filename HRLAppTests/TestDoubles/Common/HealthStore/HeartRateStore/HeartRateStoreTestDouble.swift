//
//  HeartRateStoreTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

class HeartRateStoreTestDouble {

    // MARK: - Public properties

    fileprivate (set) var queryRecordsCount = 0

    fileprivate (set) var lastQueryRecordsStartDate: Date?

    var queryRecordsResult: [HeartRateRecord]?
}

// MARK: - HeartRateStoreProtocol methods

extension HeartRateStoreTestDouble: HeartRateStoreProtocol {
    func queryRecords(from startDate: Date,
                      resultsHandler: @escaping HeartRateStoreProtocol.ResultsHandler) {
        queryRecordsCount += 1

        lastQueryRecordsStartDate = startDate

        guard let result = queryRecordsResult else {
            return
        }

        resultsHandler(result)
    }
}
