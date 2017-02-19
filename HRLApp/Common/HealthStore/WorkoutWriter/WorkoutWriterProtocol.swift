//
//  WorkoutWriterProtocol.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 17/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

protocol WorkoutWriterProtocol {

    // MARK: - Type definitions

    typealias CompletionHandler = (Bool) -> Void

    // MARK: - Methods

    func saveWorkout(_ workout: Workout,
                     startingAt start: Date,
                     endingAt end: Date,
                     completionHandler: @escaping CompletionHandler)
}
