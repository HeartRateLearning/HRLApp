//
//  SetupSetupPresenter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 15/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

final class SetupPresenter {

    // MARK: - Dependencies

    weak var view: SetupViewInput!
    weak var router: SetupRouterInput!

    var interactor: SetupInteractorInput!
}

// MARK: - SetupModuleInput methods

extension SetupPresenter: SetupModuleInput {}

// MARK: - SetupViewOutput methods

extension SetupPresenter: SetupViewOutput {
    func viewIsReady() {
        interactor.execute()
    }
}

// MARK: - SetupInteractorOutput methods

extension SetupPresenter: SetupInteractorOutput {
    func interactorDidPerformSetup(_ interactor: SetupInteractorInput) {
        router.presentWorkoutList()
    }

    func interactorDidFailToPerformSetup(_ interactor: SetupInteractorInput) {
        print("SetupPresenter: SetupInteractor: didFailToPerformSetup")
    }
}
