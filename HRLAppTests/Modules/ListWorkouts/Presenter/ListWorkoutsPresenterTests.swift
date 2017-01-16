//
//  ListWorkoutsListWorkoutsPresenterTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

class ListWorkoutsPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: ListWorkoutsInteractorInput {

    }

    class MockRouter: ListWorkoutsRouterInput {

    }

    class MockViewController: ListWorkoutsViewInput {

        func setupInitialState() {

        }
    }
}
