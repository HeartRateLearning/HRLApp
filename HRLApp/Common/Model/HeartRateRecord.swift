//
//  HeartRateRecord.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 31/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

struct HeartRateRecord {
    let date: Date
    let bpm: Float
}

extension HeartRateRecord: Equatable {}

func ==(lhs: HeartRateRecord, rhs: HeartRateRecord) -> Bool {
    return lhs.date == rhs.date && lhs.bpm == rhs.bpm
}
