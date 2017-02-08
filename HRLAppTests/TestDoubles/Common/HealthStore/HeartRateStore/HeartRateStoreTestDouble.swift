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

final class HeartRateStoreTestDouble {

    // MARK: - Public properties

    fileprivate (set) var queryRecordsAfterCount = 0
    fileprivate (set) var queryRecordsAfterOrEqualCount = 0

    fileprivate (set) var lastQueryRecordsAfterStartDate: Date?
    fileprivate (set) var lastQueryRecordsAfterEndDate: Date?
    fileprivate (set) var lastQueryRecordsAfterOrEqualStartDate: Date?
    fileprivate (set) var lastQueryRecordsAfterOrEqualEndDate: Date?

    var queryRecordsAfterResult: [HeartRateRecord]?
    var queryRecordsAfterOrEqualResult: [HeartRateRecord]?
}

// MARK: - HeartRateStoreProtocol methods

extension HeartRateStoreTestDouble: HeartRateStoreProtocol {
    func queryRecords(after startDate: Date,
                      before endDate: Date,
                      resultsHandler: @escaping HeartRateStoreProtocol.ResultsHandler) {
        queryRecordsAfterCount += 1

        lastQueryRecordsAfterStartDate = startDate
        lastQueryRecordsAfterEndDate = endDate

        guard let results = queryRecordsAfterResult else {
            return
        }

        resultsHandler(results)
    }

    func queryRecords(afterOrEqualTo startDate: Date,
                      before endDate: Date,
                      resultsHandler: @escaping HeartRateStoreProtocol.ResultsHandler) {
        queryRecordsAfterOrEqualCount += 1

        lastQueryRecordsAfterOrEqualStartDate = startDate
        lastQueryRecordsAfterOrEqualEndDate = endDate

        guard let results = queryRecordsAfterOrEqualResult else {
            return
        }

        resultsHandler(results)
    }
}
