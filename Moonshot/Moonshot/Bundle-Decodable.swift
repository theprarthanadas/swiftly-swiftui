//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Prarthana Das on 23/08/23.
//

import Foundation

extension Bundle {
    func decode<TypeSafe: Codable>(_ file: String) -> TypeSafe {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not locate \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not extract data from \(file)")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(TypeSafe.self, from: data) else {
            fatalError("Could not convert data to dictionary")
        }
        
        return loaded
    }
}
