//
//  InstagramTextField.swift
//  Instagram
//
//  Created by 소연 on 2022/04/04.
//

import UIKit

import SnapKit
import Then

class IDSTextField: UITextField {
    
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
        layer.cornerRadius = 30
        layer.masksToBounds = true
        font = IDSFont.body1
        backgroundColor = .white
    }
    
    // MARK: - Custom Method
    
    internal func setPlaceholder(placeholder: String) {
        self.placeholder = placeholder
    }
}
