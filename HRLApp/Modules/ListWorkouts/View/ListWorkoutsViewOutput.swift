//
//  ListWorkoutsListWorkoutsViewOutput.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

protocol ListWorkoutsViewOutput {
    func viewIsReady()

    func numberOfWorkouts() -> Int
    func workout(at index: Int) -> String

    func add()
    func didSelectWorkout(at index: Int)
}
