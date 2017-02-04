//
//  GetHeartRatesInteractorOutputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 04/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

class GetHeartRatesInteractorOutputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var didFindHeartRatesCount = 0

    fileprivate (set) var lastFoundRecords: [HeartRateRecord]?
}

// MARK: - GetHeartRatesInteractorOutput methods

extension GetHeartRatesInteractorOutputTestDouble: GetHeartRatesInteractorOutput {
    func interactor(_ interactor: GetHeartRatesInteractorInput,
                    didFindHeartRates records: [HeartRateRecord]) {
        didFindHeartRatesCount += 1

        lastFoundRecords = records
    }
}
