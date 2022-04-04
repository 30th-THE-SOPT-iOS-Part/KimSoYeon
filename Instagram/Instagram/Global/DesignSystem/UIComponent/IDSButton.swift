//
//  IDSButton.swift
//  Instagram
//
//  Created by 소연 on 2022/04/04.
//

import UIKit

import SnapKit
import Then

final class IDSButton: UIButton {
    
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
    
    // MARK: - Init UI
    
    private func configUI() {
        
    }
    
    private func setLayout() {

    }
    
    // MARK: - Custom Method
    
    internal func setButtonColors(normalBgColor: UIColor,
                             normalFontColor: UIColor,
                             activatedBgColor: UIColor,
                             activatedFontColor: UIColor) {
        
    }
    
    internal func setTitleWithStyle(title: String,
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
    
    internal func setLeftIcon(imageName: String) {
        leftIconImageView.isHidden = false
        leftIconImageView.image = UIImage(named: imageName)
    }
    
    internal func setRightIcon(imageName: String) {
        rightIconImageView.isHidden = false
        rightIconImageView.image = UIImage(named: imageName)
    }
    
    internal func setBorder(width: CGFloat, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}


