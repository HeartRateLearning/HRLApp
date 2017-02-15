//
//  SetupSetupPresenter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 15/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

class SetupPresenter: SetupModuleInput, SetupViewOutput, SetupInteractorOutput {

    weak var view: SetupViewInput!
    var interactor: SetupInteractorInput!
    var router: SetupRouterInput!

    func viewIsReady() {

    }
}
