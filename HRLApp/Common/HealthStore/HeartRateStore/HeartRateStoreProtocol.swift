//
//  HeartRateStoreProtocol.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 01/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

protocol HeartRateStoreProtocol {

    // MARk: - Type definitions

    typealias ResultsHandler = ([HeartRateRecord]) -> Void

    // MARK: - Methods

    func queryRecords(after startDate: Date,
                      before endDate: Date,
                      resultsHandler: @escaping ResultsHandler)

    func queryRecords(afterOrEqualTo startDate: Date,
                      before endDate: Date,
                      resultsHandler: @escaping ResultsHandler)
}
