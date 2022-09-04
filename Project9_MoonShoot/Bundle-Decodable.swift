//
//  Bundle-Decodable.swift
//  Project7_Moonshot
//
//  Created by admin on 17.08.2022.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) file.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from url.")
        }
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode data from data.")
        }
        return loaded
    }
}
