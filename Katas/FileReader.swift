//
//  FileReader.swift
//  Katas
//
//  Created by Keith Staines on 29/08/2022.
//

import Foundation


class DataFileReader {
    
    let filename: String
    
    init(filename: String) {
        self.filename = filename
    }
    
    func readFile() -> [String] {
        var encoding: String.Encoding = .utf8
        let bundle = BundleHelper().bundle
        guard
            let url = bundle.url(forResource: filename, withExtension: "dat"),
            let string = try? String(contentsOf: url, usedEncoding: &encoding)
        else { return [] }
        return string
            .trimmingCharacters(in: .whitespaces)
            .components(separatedBy: .newlines)
            .map { $0.trimmingCharacters(in: .whitespaces) }
    }
    
    
}
