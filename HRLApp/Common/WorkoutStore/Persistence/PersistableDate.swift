//
//  PersistableDate.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 12/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

protocol PersistableDate {
    var date: Date { get }
    var mostRecentRecord: WorkoutRecord? { get }
}
