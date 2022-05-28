//
//  TodoManager.swift
//  7th-Seminar
//
//  Created by 소연 on 2022/05/28.
//

import Foundation

final class TodoManager {
    // service code
    static let shared = TodoManager()
    private init() {}
}

extension TodoManager {
    func getTodoMock() -> [Todo] {
        return MockParser.load([Todo].self, from: "Todo")!
    }
}
