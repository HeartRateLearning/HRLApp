//
//  ListWorkoutDatesListWorkoutDatesViewController.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 30/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

class ListWorkoutDatesViewController: UIViewController, ListWorkoutDatesViewInput {

    var output: ListWorkoutDatesViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: ListWorkoutDatesViewInput
    func setupInitialState() {
    }
}
