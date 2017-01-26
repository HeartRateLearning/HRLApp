//
//  AddWorkoutAddWorkoutRouter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

// MARK: - Main body

class AddWorkoutRouter {

    // MARK: - Dependencies

    weak var viewController: AddWorkoutViewController!
}

// MARK: - AddWorkoutRouterInput methods

extension AddWorkoutRouter: AddWorkoutRouterInput {
    func presentWorkoutList() {
        guard let navigationController = viewController.navigationController else {
            return
        }

        navigationController.popViewController(animated: true)
    }
}
