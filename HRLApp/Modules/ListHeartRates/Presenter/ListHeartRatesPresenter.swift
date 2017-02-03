//
//  ListHeartRatesListHeartRatesPresenter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

class ListHeartRatesPresenter: ListHeartRatesModuleInput, ListHeartRatesViewOutput, ListHeartRatesInteractorOutput {

    weak var view: ListHeartRatesViewInput!
    var interactor: ListHeartRatesInteractorInput!
    var router: ListHeartRatesRouterInput!

    func viewIsReady() {

    }
}
