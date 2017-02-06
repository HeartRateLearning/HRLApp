//
//  SaveWorkingOutsInteractorInput.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 06/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

protocol SaveWorkingOutsInteractorInput {
    func execute(withWorkoutIndex workoutIndex: Int, dateIndex: Int, workingOuts: [Bool])
}
