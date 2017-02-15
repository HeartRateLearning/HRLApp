//
//  SetupSetupViewController.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 15/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController, SetupViewInput {

    var output: SetupViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: SetupViewInput
    func setupInitialState() {
    }
}
