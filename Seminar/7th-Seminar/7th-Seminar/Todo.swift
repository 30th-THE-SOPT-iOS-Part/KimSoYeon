//
//  Todo.swift
//  7th-Seminar
//
//  Created by 소연 on 2022/05/28.
//

import Foundation

struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
