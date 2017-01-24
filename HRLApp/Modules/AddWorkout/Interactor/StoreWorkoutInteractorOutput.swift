//
//  StoreWorkoutInteractorOutput.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 24/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

protocol StoreWorkoutInteractorOutput: class {
    func interactor(_ interactor: StoreWorkoutInteractorInput, didStoreWorkout workout: String)
    func interactor(_ interactor: StoreWorkoutInteractorInput,
                    didFailToStoreWorkoutWithIndex index: Int)
}
