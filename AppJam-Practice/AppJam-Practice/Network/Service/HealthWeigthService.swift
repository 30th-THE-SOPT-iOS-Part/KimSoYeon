//
//  HealthWeigthService.swift
//  AppJam-Practice
//
//  Created by 소연 on 2022/06/24.
//

import Moya

enum HealthWeightService {
    case weight(_ param: HealthWeight)
}

extension HealthWeightService: BaseTargetType {
    var path: String {
        switch self {
        case .weight:
            return "/health/weight"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .weight:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .weight(let param):
            return .requestParameters(parameters: ["weight" : param.weight], encoding: URLEncoding.queryString)
        }
    }
}
