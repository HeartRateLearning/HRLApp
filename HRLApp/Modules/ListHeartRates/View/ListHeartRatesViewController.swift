//
//  ListHeartRatesListHeartRatesViewController.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

class ListHeartRatesViewController: UIViewController, ListHeartRatesViewInput {

    var output: ListHeartRatesViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: ListHeartRatesViewInput
    func setupInitialState() {
    }
}
