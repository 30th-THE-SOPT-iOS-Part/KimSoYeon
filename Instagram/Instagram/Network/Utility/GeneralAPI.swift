//
//  GeneralAPI.swift
//  Instagram
//
//  Created by 소연 on 2022/04/04.
//

import Foundation

struct GeneralAPI {
    
    // MARK: - Base URL
    
    static let baseURL = "http://13.124.62.236"
    
    static let imageBaseURL = "https://picsum.photos/v2"
    
    // MARK: - Feature URL
    
    static let signInURL = "/auth/signin"
    static let signUpURL = "/auth/signup"
    
    static let imageList = "/list"
}
