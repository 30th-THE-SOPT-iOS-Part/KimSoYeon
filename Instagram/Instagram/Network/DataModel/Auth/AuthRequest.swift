//
//  AuthRequest.swift
//  Instagram
//
//  Created by 소연 on 2022/05/13.
//

import Foundation

struct AuthRequest: Codable {
    let name, email, password: String
}
