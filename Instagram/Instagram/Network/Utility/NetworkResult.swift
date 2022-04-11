//
//  NetworkResult.swift
//  Instagram
//
//  Created by 소연 on 2022/04/04.
//

import Foundation

enum NetworkResult: Int {
    case okay = 200
    case created = 201
    case noContent = 204
    case badRequest = 400
    case unAuthorized = 401
    case nullValue = 402
    case forbidden = 403
    case notFound = 404
    case conflict = 409
    case internalServerError = 500
    case serviceUnavailable = 503
    case dbError = 600
}

