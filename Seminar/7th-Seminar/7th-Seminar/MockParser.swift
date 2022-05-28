//
//  MockParser.swift
//  7th-Seminar
//
//  Created by 소연 on 2022/05/28.
//

import Foundation

final class MockParser {
    static func load<D: Codable>(_ type: D.Type, from resourceName: String) -> D? {
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "json") else {
            return nil
        }
        
        guard let jsonString = try? String(contentsOfFile: path) else {
            return nil
        }
        
        print(jsonString)
        
        let decoder = JSONDecoder()
        let data = jsonString.data(using: .utf8)
        print(data)
        
        guard let data = data else { return nil }
        return try? decoder.decode(type, from: data)
    }
}

