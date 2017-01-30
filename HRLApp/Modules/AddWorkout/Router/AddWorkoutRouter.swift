//
//  AddWorkoutAddWorkoutRouter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

extension AddWorkoutViewController {

    // MARK: - Overrided methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {}
}

// MARK: - AddWorkoutRouterInput methods

extension AddWorkoutViewController: AddWorkoutRouterInput {
    func presentWorkoutList() {
        performSegue(withIdentifier: Segues.unwindAddWorkout, sender: self)
    }
}

// MARK: - Private body

private extension AddWorkoutViewController {

    // MARK: - Segues

    enum Segues {
        static let unwindAddWorkout = "addWorkoutUnwindSegue"
    }
}
