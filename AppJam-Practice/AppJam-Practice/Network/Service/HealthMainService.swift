//
//  HealthMainService.swift
//  AppJam-Practice
//
//  Created by 소연 on 2022/06/24.
//

import Moya

enum HealthMainService {
    case health
}

extension HealthMainService: BaseTargetType {
    var path: String {
        switch self {
        case .health:
            return "/health"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .health:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .health:
            return .requestPlain
        }
    }
}
