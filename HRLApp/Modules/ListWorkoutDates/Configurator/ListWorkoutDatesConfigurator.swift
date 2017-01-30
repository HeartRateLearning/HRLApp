//
//  ListWorkoutDatesListWorkoutDatesConfigurator.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 30/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

class ListWorkoutDatesModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ListWorkoutDatesViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ListWorkoutDatesViewController) {

        let router = ListWorkoutDatesRouter()

        let presenter = ListWorkoutDatesPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ListWorkoutDatesInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
