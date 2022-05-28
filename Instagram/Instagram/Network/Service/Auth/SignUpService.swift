//
//  AuthService.swift
//  Instagram
//
//  Created by 소연 on 2022/05/10.
//

import Foundation

import Moya

enum SignUpService {
    case signUp(parameter: SignUpRequest)
}

extension SignUpService: TargetType {
    var baseURL: URL {
        return URL(string: GeneralAPI.baseURL)!
    }
    
    var path: String {
        switch self {
        case .signUp:
            return GeneralAPI.signUpURL
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .signUp:
            return JSONEncoding.default
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signUp:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .signUp(let parameter):
            let parameter: [String: Any] = ["name": parameter.name,
                                            "email": parameter.email,
                                            "password": parameter.password]
            return .requestParameters(parameters: parameter, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .signUp:
            return ["Content-Type": "application/json"]
        }
    }
}
