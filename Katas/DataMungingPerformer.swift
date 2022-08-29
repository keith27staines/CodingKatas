//
//  DataMungingPerformer.swift
//  Katas
//
//  Created by Keith Staines on 29/08/2022.
//

import Foundation

typealias DifferenceDescribing = Differencing & SelfDescribing

class DataMungingPerformer<T: DifferenceDescribing> {
    let reader: DataFileReader
    let cleanser: Cleanser
    let differenceFinder: MaximumDifferenceFinder<T>
    var modelAdapter: (String) -> T?
    
    func describeMaximumDifference() -> String? {
        let lines = reader.readFile()
        let cleansed = cleanser.cleanse(lines: lines)
        let models = cleansed.compactMap(modelAdapter)
        let maximumDifference = differenceFinder.findMaximumDifference(models)
        return maximumDifference?.describe()
    }
    
    init(reader: DataFileReader,
         cleanser: Cleanser,
         differenceFinder: MaximumDifferenceFinder<T>,
         modelAdapter: @escaping (String) -> T?
    ) {
        self.reader = reader
        self.cleanser = cleanser
        self.differenceFinder = differenceFinder
        self.modelAdapter = modelAdapter
    }
}
