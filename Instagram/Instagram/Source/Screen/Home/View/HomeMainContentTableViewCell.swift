//
//  HomeMainContentTableViewCell.swift
//  Instagram
//
//  Created by 소연 on 2022/04/25.
//

import UIKit

import SnapKit
import Then

protocol HomeMainContentTableViewCellDelegate: AnyObject {
    func touchUpLikeButton(index: Int)
}

final class HomeMainContentTableViewCell: UITableViewCell {
    static var cellIdentifier: String { return String(describing: self) }
    
    // MARK: - Properties
    
    private var userImageView = UIImageView()
    
    private var userNameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = IDSFont.body4
    }
    
    private var moreButton = UIButton().then {
        $0.setTitle("", for: .normal)
        $0.setImage(Asset.Assets.icnMore.image, for: .normal)
    }
    
    private var contentImageView = UIImageView()
    
    private var buttonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }
    
    private lazy var likeButton = UIButton().then {
        $0.setTitle("", for: .normal)
        $0.setImage(Asset.Assets.icnUnlike.image, for: .normal)
        $0.setImage(Asset.Assets.icnLike.image, for: .selected)
        $0.addTarget(self, action: #selector(touchUpLikeButton), for: .touchUpInside)
    }
    
    private var commentButton = UIButton().then {
        $0.setTitle("", for: .normal)
        $0.setImage(Asset.Assets.icnComment.image, for: .normal)
    }
    
    private var shareButtn = UIButton().then {
        $0.setTitle("", for: .normal)
        $0.setImage(Asset.Assets.icnShare.image, for: .normal)
    }
    
    private var bookMarkButton = UIButton().then {
        $0.setTitle("", for: .normal)
        $0.setImage(Asset.Assets.icnBookmark.image, for: .normal)
    }
    
    private var likeLabel = UILabel().then {
        $0.textColor = .black
        $0.font = IDSFont.body5
        $0.text = "좋아요"
        $0.setTextSpacingBy(value: -0.3)
    }
    
    private var contentUserNameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = IDSFont.body4
    }
    
    private var contentLabel = UILabel().then {
        $0.textColor = .black
        $0.font = IDSFont.body4
        $0.setTextSpacingBy(value: -0.3)
        $0.numberOfLines = 1
    }
    
    private var commentLabel = UILabel().then {
        $0.font = IDSFont.body4
        $0.textColor = .darkGray
        $0.setTextSpacingBy(value: -0.3)
    }

    weak var delegate: HomeMainContentTableViewCellDelegate?
    var index: Int = 0
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
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
        contentView.addSubviews([userImageView,
                                 userNameLabel,
                                 moreButton,
                                 contentImageView,
                                 buttonStackView,
                                 bookMarkButton,
                                 likeLabel,
                                 contentUserNameLabel,
                                 contentLabel,
                                 commentLabel])
        
        buttonStackView.addArrangedSubview(likeButton)
        buttonStackView.addArrangedSubview(commentButton)
        buttonStackView.addArrangedSubview(shareButtn)
        
        userImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(6)
            $0.width.height.equalTo(24)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(userImageView.snp.centerY)
            $0.leading.equalTo(userImageView.snp.trailing).offset(6)
        }
        
        moreButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(10)
            $0.width.height.equalTo(24)
        }
        
        contentImageView.snp.makeConstraints {
            $0.top.equalTo(userImageView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
//            $0.height.equalTo(340)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(contentImageView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(10)
            $0.width.equalTo(92)
            $0.height.equalTo(24)
        }
        
        bookMarkButton.snp.makeConstraints {
            $0.top.equalTo(contentImageView.snp.bottom).offset(8)
            $0.trailing.equalToSuperview().inset(10)
            $0.width.height.equalTo(24)
        }
        
        likeLabel.snp.makeConstraints {
            $0.top.equalTo(buttonStackView.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(12)
        }
        
        contentUserNameLabel.snp.makeConstraints {
            $0.top.equalTo(likeLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(12)
        }
        
        contentLabel.snp.makeConstraints {
            $0.centerY.equalTo(contentUserNameLabel.snp.centerY)
            $0.leading.equalTo(contentUserNameLabel.snp.trailing).offset(4)
        }
        
        commentLabel.snp.makeConstraints {
            $0.top.equalTo(contentUserNameLabel.snp.bottom).offset(4)
            $0.leading.bottom.equalToSuperview().inset(12)
        }
    }

    // MARK: - Custom Method
    
    internal func setData(_ data: HomeMainContentDataModel) {
        userImageView.image = data.userImage
        userNameLabel.text = data.userName
        contentUserNameLabel.text = data.userName
        contentImageView.image = data.contentImage
        contentLabel.text = data.content
        likeLabel.text = "좋아요 \(data.likeCount)"
        commentLabel.text = "댓글 \(data.commentCount) 모두 보기"
    }
    
    // MARK: - @objc
    
    @objc func touchUpLikeButton() {
        delegate?.touchUpLikeButton(index: index)
        likeButton.isSelected.toggle()
    }
}
