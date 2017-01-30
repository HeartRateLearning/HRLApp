//
//  ListWorkoutDatesListWorkoutDatesViewOutput.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 30/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

protocol ListWorkoutDatesViewOutput {
    func viewIsReady()

    func numberOfDates() -> Int
    func date(at index: Int) -> Date
}
