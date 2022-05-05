//
//  HomeMainStoryDataModel.swift
//  Instagram
//
//  Created by 소연 on 2022/04/25.
//

import UIKit

struct HomeMainStoryDataModel {
    let userImage: UIImage
    let userName: String
}

extension HomeMainStoryDataModel {
    static let sampleData: [HomeMainStoryDataModel] = [
        HomeMainStoryDataModel(userImage: Asset.Assets.avatar1.image, userName: "김루희"),
        HomeMainStoryDataModel(userImage: Asset.Assets.avatar2.image, userName: "박인우"),
        HomeMainStoryDataModel(userImage: Asset.Assets.avatar3.image, userName: "한유진"),
        HomeMainStoryDataModel(userImage: Asset.Assets.avatar4.image, userName: "이경민"),
        HomeMainStoryDataModel(userImage: Asset.Assets.avatar5.image, userName: "임윤휘"),
        HomeMainStoryDataModel(userImage: Asset.Assets.avatar6.image, userName: "최영린"),
        HomeMainStoryDataModel(userImage: Asset.Assets.avatar1.image, userName: "김태현"),
    ]
}
