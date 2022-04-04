//
//  IDSButton.swift
//  Instagram
//
//  Created by 소연 on 2022/04/04.
//

import UIKit

import SnapKit
import Then

final class BDSButton: UIButton {
    
    enum FontWeight {
        case regular
        case medium
        case bold
        case semiBold
    }
    
    // MARK: - Properties
    
    private var leftIconImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.isHidden = true
    }
    
    private var rightIconImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.isHidden = true
    }
    
    
    init() {
        super.init(frame: .zero)
        configUI()
        setLayout()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        configUI()
        setLayout()
    }
    
    // MARK: - Private Methods
    
    /// 디폴트 버튼 스타일 설정
    private func configUI() {
        
    }
    
    private func setLayout() {

    }
    
    // MARK: - Public Methods
    
    public func setButtonColors(normalBgColor: UIColor,
                             normalFontColor: UIColor,
                             activatedBgColor: UIColor,
                             activatedFontColor: UIColor) {
        
    }
    
    public func setTitleWithStyle(title: String,
                                  size: CGFloat,
                                  weight: FontWeight = .regular) {
        let font: UIFont
        
        // FIXME: - 폰트 수정
        switch weight {
        case .regular:
            font = IDSFont.body1
        case .medium:
            font = IDSFont.body1
        case .bold:
            font = IDSFont.body1
        case .semiBold:
            font = IDSFont.body1
        }
        
        self.titleLabel?.font = font
        self.setTitle(title, for: .normal)
    }
    
    public func setLeftIcon(imageName: String) {
        leftIconImageView.isHidden = false
        leftIconImageView.image = UIImage(named: imageName)
    }
    
    public func setRightIcon(imageName: String) {
        rightIconImageView.isHidden = false
        rightIconImageView.image = UIImage(named: imageName)
    }
    
    public func setBorder(width: CGFloat, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}


