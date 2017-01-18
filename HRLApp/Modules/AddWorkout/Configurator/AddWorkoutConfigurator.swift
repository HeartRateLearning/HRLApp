//
//  AddWorkoutAddWorkoutConfigurator.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

class AddWorkoutModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? AddWorkoutViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: AddWorkoutViewController) {

        let router = AddWorkoutRouter()

        let presenter = AddWorkoutPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = AddWorkoutInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
