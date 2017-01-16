//
//  ListWorkoutsListWorkoutsPresenter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

class ListWorkoutsPresenter: ListWorkoutsModuleInput, ListWorkoutsViewOutput, ListWorkoutsInteractorOutput {

    weak var view: ListWorkoutsViewInput!
    var interactor: ListWorkoutsInteractorInput!
    var router: ListWorkoutsRouterInput!

    func viewIsReady() {

    }
}
