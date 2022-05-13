//
//  SignUpAPI.swift
//  Instagram
//
//  Created by 소연 on 2022/05/10.
//

import Foundation

import Moya
import Accelerate

final class SignUpAPI {
    
    // MARK: - Static Properties
    
    static let shared: SignUpAPI = SignUpAPI()
    private init() { }
    
    // MARK: - Network Properties
    
    var authProvider = MoyaProvider<SignUpService>(plugins: [MoyaLoggerPlugin()])
    
    public private(set) var signUpResponse: BaseResponse<SignUpResponse>?
    public private(set) var signUpData: SignUpResponse?
    
    // MARK: - GET
    
    func signUp(parameter: SignUpRequest, completion: @escaping ((SignUpResponse?, Error?) -> ())) {
        authProvider.request(.signUp(parameter: parameter)) { [weak self] response in
            switch response {
            case .success(let result):
                do {
                    self?.signUpResponse = try result.map(BaseResponse<SignUpResponse>.self)
                    guard let data = self?.signUpResponse?.data else {
                        completion(nil, Error.self as? Error)
                        return
                    }
                    completion(data, nil)
                } catch(let err) {
                    print(err.localizedDescription)
                    completion(nil, err)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil, err)
            }
        }
    }
}
