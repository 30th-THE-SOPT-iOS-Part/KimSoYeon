//
//  SignInService.swift
//  Instagram
//
//  Created by 소연 on 2022/05/13.
//

import Foundation

import Moya

enum SignInService {
    case signIn(parameter: AuthRequest)
}

extension SignInService: TargetType {
    var baseURL: URL {
        return URL(string: GeneralAPI.baseURL)!
    }
    
    var path: String {
        switch self {
        case .signIn:
            return GeneralAPI.signInURL
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .signIn:
            return JSONEncoding.default
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signIn:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .signIn(let parameter):
            let parameter: [String: Any] = ["name": parameter.name,
                                            "email": parameter.email,
                                            "password": parameter.password]
            return .requestParameters(parameters: parameter, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .signIn:
            return ["Content-Type": "application/json"]
        }
    }
}

