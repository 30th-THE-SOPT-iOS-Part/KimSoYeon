//
//  SignInAPI.swift
//  Instagram
//
//  Created by 소연 on 2022/05/13.
//

import Foundation

import Moya

final class SignInAPI {
    
    // MARK: - Static Properties
    
    static let shared: SignInAPI = SignInAPI()
    private init() { }
    
    // MARK: - Network Properties
    
    var authProvider = MoyaProvider<SignInService>(plugins: [MoyaLoggerPlugin()])
    
    public private(set) var signInResponse: BaseResponse<SignInResponse>?
    public private(set) var signUpData: SignInResponse?
    
    // MARK: - GET
    
    func signUp(parameter: AuthRequest, completion: @escaping ((SignInResponse?, Error?) -> ())) {
        authProvider.request(.signIn(parameter: parameter)) { [weak self] response in
            switch response {
            case .success(let result):
                do {
                    self?.signInResponse = try result.map(BaseResponse<SignInResponse>.self)
                    guard let data = self?.signInResponse?.data else {
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

