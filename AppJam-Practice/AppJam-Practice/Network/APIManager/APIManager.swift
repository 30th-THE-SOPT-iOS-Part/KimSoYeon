//
//  APIManager.swift
//  AppJam-Practice
//
//  Created by 소연 on 2022/06/24.
//

import Foundation

enum NetworkError: Error {
    case invaildServerResponse
}

class APIManager {
    private init() {}
    
    static let shared = APIManager()
    
    var fullImageURLs: [String] {
        get async {
            try! await fetchPhotoLists()
        }
    }
    
    private func fetchPhotoLists() async throws -> [String] {
        let url = URL(string: APIConstants.baseURL + "/photos")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("Client-ID " + Secrets.accessKey, forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invaildServerResponse
        }
        
        let decodedData = try JSONDecoder().decode([Photo].self, from: data)
        return decodedData.map { $0.urls.raw }
    }
}

