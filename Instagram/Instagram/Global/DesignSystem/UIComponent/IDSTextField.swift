//
//  InstagramTextField.swift
//  Instagram
//
//  Created by 소연 on 2022/04/04.
//

import UIKit

import SnapKit
import Then

final class IDSTextField: UITextField {
    
    // MARK: - Properties
    
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configUI()
    }
    
    // MARK: - Init UI
    
    private func configUI() {
        layer.cornerRadius = 3
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray5.cgColor
        font = IDSFont.body2
        backgroundColor = .systemGray6
    }
    
    // MARK: - Custom Method
    
    internal func setPlaceholder(placeholder: String) {
        self.placeholder = placeholder
    }
}
