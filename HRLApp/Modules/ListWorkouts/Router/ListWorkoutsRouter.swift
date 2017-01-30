//
//  ListWorkoutsRouter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

extension ListWorkoutsViewController {

    // MARK: - Overrided methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {}

    // MARK: - Unwind actions

    @IBAction func unwindAddWorkout(_ segue: UIStoryboardSegue) {}
}

// MARK: - ListWorkoutsRouterInput methods

extension ListWorkoutsViewController: ListWorkoutsRouterInput {
    func presentAddWorkout() {
        performSegue(withIdentifier: Segues.addWorkout, sender: self)
    }

    func presentDateList(forWorkoutAt index: Int) {
        performSegue(withIdentifier: Segues.listDates, sender: index)
    }
}

// MARK: - Private body

private extension ListWorkoutsViewController {

    // MARK: - Segues

    enum Segues {
        static let addWorkout = "addWorkoutSegue"
        static let listDates = "listDatesSegue"
    }
}
