//
//  HomeService.swift
//  Instagram
//
//  Created by 소연 on 2022/05/13.
//

import Foundation

import Moya

enum HomeService {
    case imageList
}

extension HomeService: TargetType {
    
    var baseURL: URL {
        return URL(string: GeneralAPI.imageBaseURL)!
    }
    
    var path: String {
        switch self {
        case .imageList:
            return GeneralAPI.imageList
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .imageList:
            return JSONEncoding.default
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .imageList:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .imageList:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .imageList:
            return ["Content-Type": "application/json"]
        }
    }
}
