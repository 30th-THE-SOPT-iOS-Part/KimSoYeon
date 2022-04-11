//
//  BaseTargetType.swift
//  Instagram
//
//  Created by 소연 on 2022/04/04.
//

import Foundation

import Moya

protocol BaseTargetType: TargetType { }

extension BaseTargetType {
    var baseURL: URL {
        // FIXME: - Constant로 관리 + 강제언래핑 수정 
        return URL(string: "")!
    }
    
    var sampleData: Data {
        return Data()
    }
}
