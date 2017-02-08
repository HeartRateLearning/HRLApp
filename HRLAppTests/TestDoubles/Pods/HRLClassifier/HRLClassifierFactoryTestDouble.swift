//
//  HRLClassifierFactoryTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 08/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation
import HRLClassifier

// MARK: - Main body

final class HRLClassifierFactoryTestDouble {

    // MARK: - Public properties

    fileprivate (set) var makeClassifierCount = 0

    fileprivate (set) var lastMakeClassifierDataFrame: HRLClassifier.DataFrame?

    var makeClassifierResult: HRLClassifier.ClassifierProtocol?
}

// MARK: - HRLClassifier.ClassifierFactoryProtocol methods

extension HRLClassifierFactoryTestDouble: HRLClassifier.ClassifierFactoryProtocol {
    func makeClassifier(with dataFrame: HRLClassifier.DataFrame) throws -> HRLClassifier.ClassifierProtocol {
        makeClassifierCount += 1

        lastMakeClassifierDataFrame = dataFrame

        guard let result = makeClassifierResult else {
            throw HRLClassifier.ClassifierFactoryError.insufficientData
        }

        return result
    }
}
