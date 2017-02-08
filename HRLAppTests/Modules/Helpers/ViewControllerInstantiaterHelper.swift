//
//  ViewControllerInstantiaterHelper.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 17/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Main body

final class ViewControllerInstantiaterHelper {
    
    // MARK: - Private properties

    fileprivate let storyboard: UIStoryboard

    // MARK: - Init methods

    init(storyboardName: String = "Main", storyboardBundle: Bundle = Bundle.main) {
        storyboard = UIStoryboard(name: storyboardName, bundle: storyboardBundle)
    }

    // MARK: - Public methods

    func viewController(with identifier: String) -> UIViewController {
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}
