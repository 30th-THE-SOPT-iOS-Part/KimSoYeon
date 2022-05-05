//
//  HomeMainContentDataModel.swift
//  Instagram
//
//  Created by 소연 on 2022/04/25.
//

import UIKit

struct HomeMainContentDataModel {
    let userImage: UIImage
    let userName: String
    
    let contentImage: UIImage
    
    let likeCount: Int
    let content: String
    let commentCount: Int
}

extension HomeMainContentDataModel {
    static let sampleData: [HomeMainContentDataModel] = [
        HomeMainContentDataModel(userImage: Asset.Assets.avatar1.image, userName: "김루희", contentImage: Asset.Assets.postImage1.image, likeCount: 300, content: "소깡이💟", commentCount: 300),
        HomeMainContentDataModel(userImage: Asset.Assets.avatar2.image, userName: "박인우", contentImage: Asset.Assets.postImage2.image, likeCount: 20, content: "박인우 바보 메롱메롱", commentCount: 10),
        HomeMainContentDataModel(userImage: Asset.Assets.avatar3.image, userName: "한유진", contentImage: Asset.Assets.postImage3.image, likeCount: 20, content: "유진아 우리 온제 놀지?", commentCount: 10),
        HomeMainContentDataModel(userImage: Asset.Assets.avatar3.image, userName: "이경민", contentImage: Asset.Assets.postImage4.image, likeCount: 110, content: "경민티비 하위", commentCount: 19),
        HomeMainContentDataModel(userImage: Asset.Assets.avatar4.image, userName: "임윤휘", contentImage: Asset.Assets.postImage1.image, likeCount: 20, content: "윤휘는 벨리곰을 좋아하나봐", commentCount: 92),
        HomeMainContentDataModel(userImage: Asset.Assets.avatar5.image, userName: "최영린", contentImage: Asset.Assets.postImage1.image, likeCount: 20, content: "영린이랑 언제 또 만나지?", commentCount: 8),
        HomeMainContentDataModel(userImage: Asset.Assets.avatar6.image, userName: "김태현", contentImage: Asset.Assets.postImage1.image, likeCount: 18, content: "태끼 태끼 산태끼", commentCount: 18),
    ]
}

