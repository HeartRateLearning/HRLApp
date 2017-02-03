//
//  ListWorkoutDatesListWorkoutDatesRouterInput.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 30/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

protocol ListWorkoutDatesRouterInput: class {
    func presentHeartRates(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int)
}
