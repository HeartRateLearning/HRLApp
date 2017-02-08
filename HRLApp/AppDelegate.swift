//
//  AppDelegate.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 15/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

@UIApplicationMain
final class AppDelegate: UIResponder {

    // MARK: - Public properties

    var window: UIWindow?
}

// MARK: UIApplicationDelegate methods

extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        HealthStoreFactorySingleton.sharedInstance.setup()

        return true
    }
}
