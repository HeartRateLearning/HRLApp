//
//  ListWorkoutsListWorkoutsConfigurator.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

class ListWorkoutsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ListWorkoutsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ListWorkoutsViewController) {

        let store = WorkoutStore()
        let router = ListWorkoutsRouter()

        let presenter = ListWorkoutsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ListWorkoutsInteractor()
        interactor.store = store
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
