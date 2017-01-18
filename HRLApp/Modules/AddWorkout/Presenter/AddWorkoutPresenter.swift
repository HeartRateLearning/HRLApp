//
//  AddWorkoutAddWorkoutPresenter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

class AddWorkoutPresenter: AddWorkoutModuleInput, AddWorkoutViewOutput, AddWorkoutInteractorOutput {

    weak var view: AddWorkoutViewInput!
    var interactor: AddWorkoutInteractorInput!
    var router: AddWorkoutRouterInput!

    func viewIsReady() {

    }
}
