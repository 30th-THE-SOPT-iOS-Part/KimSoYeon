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
    
//    var isActivated: Bool = false {
//        didSet {
//            self.backgroundColor = self.isActivated ? activatedBackgroundColor : normalBackgroundColor
//            self.setTitleColor(self.isActivated ? activatedFontColor : normalFontColor, for: .normal)
//            self.isEnabled = isActivated
//        }
//    }
    
    override var isEnabled: Bool {
        didSet {
            changeAppearance()
        }
    }

    
    private var normalBackgroundColor: UIColor = .lightGray
    private var normalFontColor: UIColor = .darkGray
    
    private var activatedBackgroundColor: UIColor = .systemBlue
    private var activatedFontColor: UIColor = .white
    
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
        layer.cornerRadius = 5
    }
    
    private func setLayout() {
        
    }
    
    private func changeAppearance() {
        backgroundColor = self.isEnabled ? activatedBackgroundColor : normalBackgroundColor
        setTitleColor(self.isEnabled ? activatedFontColor : normalFontColor, for: .normal)
    }
    
    // MARK: - Custom Method
    
    internal func setButtonColors(normalBackgroundColor: UIColor,
                             normalFontColor: UIColor,
                                  activatedBackgroundColor: UIColor,
                             activatedFontColor: UIColor) {
        self.normalBackgroundColor = normalBackgroundColor
        self.normalFontColor = normalFontColor
        self.activatedBackgroundColor = activatedBackgroundColor
        self.activatedFontColor = activatedFontColor
    }
    
    internal func setTitleWithStyle(title: String,
                                  size: CGFloat,
                                  weight: FontWeight = .regular) {
        let font: UIFont
        
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
    
    internal func setLeftIcon(image: UIImage) {
        leftIconImageView.isHidden = false
        leftIconImageView.image = image
    }
    
    internal func setRightIcon(image: UIImage) {
        rightIconImageView.isHidden = false
        rightIconImageView.image = image
    }
    
    internal func setBorder(width: CGFloat, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}


