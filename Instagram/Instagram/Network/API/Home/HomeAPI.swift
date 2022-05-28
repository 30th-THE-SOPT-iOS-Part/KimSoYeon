//
//  HomeAPI.swift
//  Instagram
//
//  Created by 소연 on 2022/05/13.
//

import Foundation

import Moya

final class HomeAPI {
    
    // MARK: - Static Properties
    
    static let shared: HomeAPI = HomeAPI()
    private init() { }
    
    // MARK: - Network Properties
    
    private let homeProvider = MoyaProvider<HomeService>(plugins: [MoyaLoggerPlugin()])
    
    public private(set) var homeResponse: BaseArrayResponseType<HomeResponse>?
    public private(set) var homeData: [HomeResponse]?
    
    func getImageList(completion: @escaping (([HomeResponse]?, Error?) -> ())) {
        homeProvider.request(.imageList) { [weak self] response in
                guard let self = self else { return }
                switch response {
                case .success(let result):
                    do {
                        self.homeResponse = try result.map(BaseArrayResponseType<HomeResponse>.self)
                        guard let data = self.homeResponse?.data else {
                            completion(nil, Error.self as? Error)
                            return
                        }
                        self.homeData = data
                        
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
