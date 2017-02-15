//
//  SetupSetupRouter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 15/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

extension SetupViewController {

    // MARK: - Overrided methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {}
}

// MARK: - SetupRouterInput methods

extension SetupViewController: SetupRouterInput {
    func presentWorkoutList() {
        performSegue(withIdentifier: Segues.main, sender: self)
    }
}

// MARK: - Private body

private extension SetupViewController {

    // MARK: - Segues

    enum Segues {
        static let main = "mainSegue"
    }
}
