//
//  GetStoredWorkoutsInteractorOutput.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 23/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

protocol GetStoredWorkoutsInteractorOutput: class {
    func interactor(_ interactor: GetStoredWorkoutsInteractorInput,
                    didFindWorkouts workouts: [String])
}
