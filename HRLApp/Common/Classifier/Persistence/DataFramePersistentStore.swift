//
//  DataFramePersistentStore.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 09/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation
import HRLClassifier

// MARK: - Main body

final class DataFramePersistentStore {

    // MARK: - Private properties

    let path: String

    // MARK: - Init methods

    convenience init(workout: Workout) {
        let searchPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                              .userDomainMask,
                                                              true)
        let documentsPath = searchPaths[0] as NSString

        let name = String(workout) as NSString
        let filename = name.appendingPathExtension(Constants.fileExtension)!

        let filepath = documentsPath.appendingPathComponent(filename)

        self.init(path: filepath)
    }

    init(path: String) {
        self.path = path
    }
}

// MARK: - DataFramePersistentStoreProtocol methods

extension DataFramePersistentStore: DataFramePersistentStoreProtocol {
    func read() -> DataFrame {
        guard let dataFrame = NSKeyedUnarchiver.unarchiveObject(withFile: path) as? DataFrame else {
            return DataFrame()
        }

        return dataFrame
    }

    func write(_ dataFrame: DataFrame) {
        if !NSKeyedArchiver.archiveRootObject(dataFrame, toFile: path) {
            print("DataFrame NOT stored in \(path)")
        }
    }
}

// MARK: - Private body

private extension DataFramePersistentStore {

    // MARK: - Constants

    enum Constants {
        static let fileExtension = "dataframe"
    }
}
