//
//  HeartRateStore.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 01/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation
import HealthKit

// MARK: - Main body

final class HeartRateStore {

    // MARK: - Public class properties

    static let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate)!

    // MARK: - Private properties

    fileprivate let store: HKHealthStore
    
    // MARK: - Init methods

    init(store: HKHealthStore) {
        self.store = store
    }
}

// MARK: - HeartRateStoreProtocol methods

extension HeartRateStore: HeartRateStoreProtocol {
    func queryRecords(after startDate: Date,
                      before endDate: Date,
                      resultsHandler: @escaping HeartRateStoreProtocol.ResultsHandler) {
        let predicate = NSPredicate(format: "%K > %@ AND %K < %@",
                                    HKPredicateKeyPathStartDate, startDate as CVarArg,
                                    HKPredicateKeyPathStartDate, endDate as CVarArg)

        queryRecords(with: predicate, resultsHandler: resultsHandler)
    }

    func queryRecords(afterOrEqualTo startDate: Date,
                      before endDate: Date,
                      resultsHandler: @escaping HeartRateStoreProtocol.ResultsHandler) {
        let predicate = NSPredicate(format: "%K >= %@ AND %K < %@",
                                    HKPredicateKeyPathStartDate, startDate as CVarArg,
                                    HKPredicateKeyPathStartDate, endDate as CVarArg)

        queryRecords(with: predicate, resultsHandler: resultsHandler)
    }
}

// MARK: - Private body

private extension HeartRateStore {

    // MARK: - Constants

    enum Constants {
        static let heartRateUnit = HKUnit(from: "count/min")
    }

    // MARK: - Private methods

    func queryRecords(with predicate: NSPredicate,
                      resultsHandler: @escaping HeartRateStoreProtocol.ResultsHandler) {
        let queryHandler = { (_: HKSampleQuery, queryResults: [HKSample]?, queryError: Error?) in
            var results = [] as [HeartRateRecord]

            if queryResults != nil {
                results = HeartRateStore.recordArray(with: queryResults as! [HKQuantitySample])
            }

            DispatchQueue.main.async {
                resultsHandler(results)
            }
        }

        let query = HKSampleQuery(sampleType: HeartRateStore.heartRateType,
                                  predicate: predicate,
                                  limit: HKObjectQueryNoLimit,
                                  sortDescriptors: nil,
                                  resultsHandler: queryHandler)

        store.execute(query)
    }

    // MARK: - Private class methods

    static func recordArray(with samples: [HKQuantitySample]) -> [HeartRateRecord] {
        return samples.map { oneSample -> HeartRateRecord in
            let date = oneSample.startDate
            let bpm = oneSample.quantity.doubleValue(for: Constants.heartRateUnit)

            return HeartRateRecord(date: date, bpm: Float(bpm))
        }
    }
}
