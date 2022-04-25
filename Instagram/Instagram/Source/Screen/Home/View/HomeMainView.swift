//
//  HomeMainView.swift
//  Instagram
//
//  Created by 소연 on 2022/04/04.
//

import UIKit

final class HomeMainView: UIView {
    
    private var navigationBar = UIView().then {
        $0.backgroundColor = .white
    }
    
    private var logoImageView = UIImageView().then {
        $0.image = Asset.Assets.instagramBlackLogo.image
    }
    
    private var buttonStackView = UIStackView().then {
        $0.axis = .horizontal
    }
    
    private var addButton = UIButton().then {
        $0.setTitle("", for: .normal)
        $0.setImage(Asset.Assets.icnAdd.image, for: .normal)
    }
    
    private var likeButton = UIButton().then {
        $0.setTitle("", for: .normal)
        $0.setImage(Asset.Assets.icnLike.image, for: .normal)
    }
    
    private var messageButton = UIButton().then {
        $0.setTitle("", for: .normal)
        $0.setImage(Asset.Assets.icnShare.image, for: .normal)
    }
    
    // MARK: - Initializer
    
    init() {
        super.init(frame: .zero)
        configUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func configUI() {
        
    }
    
    private func setLayout() {
        
    }
}
