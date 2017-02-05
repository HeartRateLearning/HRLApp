//
//  HeartRateRecord.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 31/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

struct HeartRateRecord {

    // MARK: - Public properties 

    let date: Date
    let bpm: Float
}

// MARK: - Equatable methods

extension HeartRateRecord: Equatable {}

// MARK: - Free functions

func ==(lhs: HeartRateRecord, rhs: HeartRateRecord) -> Bool {
    return lhs.date == rhs.date && lhs.bpm == rhs.bpm
}
