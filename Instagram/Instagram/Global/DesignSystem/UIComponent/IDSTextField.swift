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
    
    // MARK: - Custom Method
    
    private func configUI() {
        self.layer.cornerRadius = 30
        self.layer.masksToBounds = true
        self.font = IDSFont.body1
        self.backgroundColor = .white
    }
    
    // MARK: - Public Method
    
    public func setPlaceholder(placeholder: String) {
        self.placeholder = placeholder
    }
}
