//
//  ListHeartRatesListHeartRatesViewTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

class ListHeartRatesViewTests: XCTestCase {

    // MARK: - Properties

    var sut: ListHeartRatesViewController!

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        let instantiater = ViewControllerInstantiaterHelper()
        let viewController = instantiater.viewController(with: Constants.viewControllerId)

        sut = viewController as! ListHeartRatesViewController
    }
}

// MARK: - Private body

private extension ListHeartRatesViewTests {
    enum Constants {
        static let viewControllerId = "ListHeartRatesViewController"
    }
}
