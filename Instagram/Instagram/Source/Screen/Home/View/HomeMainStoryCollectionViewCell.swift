//
//  HomeMainStoryCollectionViewCell.swift
//  Instagram
//
//  Created by 소연 on 2022/04/25.
//

import UIKit

import SnapKit
import Then

final class HomeMainStoryCollectionViewCell: UICollectionViewCell {
    static var CellIdentifier: String { return String(describing: self) }
    
    // MARK: - Properties
    
    private var userImageView = UIImageView()
    
    private var userNameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = IDSFont.body4
    }
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Init UI
    
    private func configUI() {
        contentView.backgroundColor = .white
    }
    
    private func setLayout() {
        contentView.addSubviews([userImageView, userNameLabel])
        
        userImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(6)
            $0.width.height.equalTo(48)
            $0.centerX.equalToSuperview()
        }
        
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(userImageView.snp.bottom).offset(3)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Custom Method
    
    internal func setData(_ data: HomeMainStoryDataModel) {
        userImageView.image = data.userImage
        userNameLabel.text = data.userName
    }
}
