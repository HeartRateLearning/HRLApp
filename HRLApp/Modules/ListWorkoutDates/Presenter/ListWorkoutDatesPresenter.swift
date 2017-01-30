//
//  ListWorkoutDatesListWorkoutDatesPresenter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 30/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

class ListWorkoutDatesPresenter: ListWorkoutDatesModuleInput, ListWorkoutDatesViewOutput, ListWorkoutDatesInteractorOutput {

    weak var view: ListWorkoutDatesViewInput!
    var interactor: ListWorkoutDatesInteractorInput!
    var router: ListWorkoutDatesRouterInput!

    func viewIsReady() {

    }
}
