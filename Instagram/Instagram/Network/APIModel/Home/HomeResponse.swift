//
//  HomeResponse.swift
//  Instagram
//
//  Created by 소연 on 2022/05/13.
//

import Foundation

// MARK: - HomeResponse

struct HomeResponse: Codable {
    let id, author: String
    let width, height: Int
    let url, downloadURL: String

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}
