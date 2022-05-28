//
//  SignInRequest.swift
//  Instagram
//
//  Created by 소연 on 2022/05/10.
//

import Foundation

// MARK: - SignUp Request

struct SignInRequest: Codable {
    let email, password: String
}
