//
//  FoundHeartRateRecord.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 05/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

struct FoundHeartRateRecord {
    let date: Date
    let bpm: Float
    let workingOut: Bool
}

// MARK: - Equatable methods

extension FoundHeartRateRecord: Equatable {}

// MARK: - Free functions

func ==(lhs: FoundHeartRateRecord, rhs: FoundHeartRateRecord) -> Bool {
    return lhs.date == rhs.date && lhs.bpm == rhs.bpm && lhs.workingOut == rhs.workingOut
}
