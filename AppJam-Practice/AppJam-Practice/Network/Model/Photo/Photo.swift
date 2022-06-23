//
//  Photo.swift
//  AppJam-Practice
//
//  Created by 소연 on 2022/06/24.
//

import Foundation

struct Photo: Decodable {
    let id: String
    let width: Int
    let height: Int
    let urls: PhotoURLDescription
    let likes: Int
}

struct PhotoURLDescription: Decodable {
    let raw: String
    let full: String
}
