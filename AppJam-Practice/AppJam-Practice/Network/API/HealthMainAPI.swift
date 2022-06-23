//
//  HealthMainAPI.swift
//  AppJam-Practice
//
//  Created by 소연 on 2022/06/24.
//

import Foundation

import Moya

final class HealthMainAPI {
    static let shared: HealthMainAPI = HealthMainAPI()
    private let healthProvider = MoyaProvider<HealthMainService>(plugins: [MoyaLoggerPlugin()])
    private init() { }
    
    public private(set) var healthData: GenericResponse<HealthResponse>?
    
    // MARK: - POST 소셜로그인
    
    public func getHealthMainData(completion: @escaping ((GenericResponse<HealthResponse>?, Int?) -> ())) {
        healthProvider.request(.health) { result in
            switch result {
            case .success(let response):
                do {
                    self.healthData = try response.map(GenericResponse<HealthResponse>?.self)
                    guard let healthData = self.healthData else { return }
                    completion(healthData, nil)
                    
                } catch(let err) {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil, 500)
            }
        }
    }
}
