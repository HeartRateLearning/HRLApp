//
//  WorkoutRecord.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 04/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

struct WorkoutRecord {

    // MARK: - Type definitions

    enum WorkingOut {
        case unknown
        case `false`
        case `true`
    }

    // MARK: - Public properties

    var date: Date {
        return heartRate.date
    }

    var bpm: Float {
        return heartRate.bpm
    }

    let workingOut: WorkingOut

    // MARK: - Private properties

    fileprivate let heartRate: HeartRateRecord

    // MARK: - Init methods

    init(heartRate: HeartRateRecord, workingOut: WorkingOut) {
        self.heartRate = heartRate
        self.workingOut = workingOut
    }
}

// MARK: - Equatable methods

extension WorkoutRecord: Equatable {}

// MARK: - Free functions

func ==(lhs: WorkoutRecord, rhs: WorkoutRecord) -> Bool {
    return lhs.heartRate == rhs.heartRate && lhs.workingOut == rhs.workingOut
}
