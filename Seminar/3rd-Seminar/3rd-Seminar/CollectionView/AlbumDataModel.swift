//
//  AlbumDataModel.swift
//  3rd-Seminar
//
//  Created by 소연 on 2022/04/23.
//

import Foundation

struct AlbumDataModel {
    let albumImageName: String
    let albumTitle: String
    let albumSinger: String
}

extension AlbumDataModel {
    static let sampleData: [AlbumDataModel] = [
        AlbumDataModel(albumImageName: "album1", albumTitle: "avante", albumSinger: "기리보이"),
        AlbumDataModel(albumImageName: "album2", albumTitle: "나의 모양", albumSinger: "권진아"),
        AlbumDataModel(albumImageName: "album3", albumTitle: "가습기", albumSinger: "한요한"),
        AlbumDataModel(albumImageName: "album4", albumTitle: "Strange Weather 이상기후", albumSinger: "쏜애플"),
        AlbumDataModel(albumImageName: "album5", albumTitle: "전설", albumSinger: "JANNABI"),
        AlbumDataModel(albumImageName: "album6", albumTitle: "선물", albumSinger: "백예린")
    ]
}
