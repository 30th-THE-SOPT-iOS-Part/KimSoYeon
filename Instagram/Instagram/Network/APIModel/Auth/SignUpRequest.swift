//
//  SignUpRequest.swift
//  Instagram
//
//  Created by 소연 on 2022/05/10.
//

import Foundation

// MARK: - SignUp Request

struct SignUpRequest: Codable {
    let name, email, password: String
}
