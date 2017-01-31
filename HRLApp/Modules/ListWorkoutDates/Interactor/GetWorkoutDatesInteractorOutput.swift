//
//  GetWorkoutDatesInteractorOutput.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 31/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

protocol GetWorkoutDatesInteractorOutput: class {
    func interactor(_ interactor: GetWorkoutDatesInteractorInput, didFindWorkoutDates dates: [Date])
}
