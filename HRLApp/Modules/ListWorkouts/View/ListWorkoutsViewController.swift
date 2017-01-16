//
//  ListWorkoutsListWorkoutsViewController.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

class ListWorkoutsViewController: UIViewController, ListWorkoutsViewInput {

    var output: ListWorkoutsViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: ListWorkoutsViewInput
    func setupInitialState() {
    }
}
