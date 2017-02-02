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

    func queryRecords(from startDate: Date, resultsHandler: @escaping ResultsHandler)
}
