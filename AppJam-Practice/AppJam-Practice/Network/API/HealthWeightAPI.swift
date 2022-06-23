//
//  HealthWeightAPI.swift
//  AppJam-Practice
//
//  Created by 소연 on 2022/06/24.
//

import Foundation

import Moya

final class HealthWeightAPI {
    static let shared: HealthWeightAPI = HealthWeightAPI()
    private let weightProvider = MoyaProvider<HealthWeightService>(plugins: [MoyaLoggerPlugin()])
    private init() { }
    
    public private(set) var weightData: GenericResponse<WeightResponse>?
    
    public func postWeightData(param: HealthWeight, completion: @escaping ((GenericResponse<WeightResponse>?, Int?) -> ())) {
        weightProvider.request(.weight(param)) { result in
            switch result {
            case .success(let response):
                do {
                    self.weightData = try response.map(GenericResponse<WeightResponse>?.self)
                    guard let weightData = self.weightData else { return }
                    completion(weightData, nil)
                    
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
