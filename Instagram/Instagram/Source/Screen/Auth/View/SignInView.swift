//
//  SignInView.swift
//  Instagram
//
//  Created by 소연 on 2022/04/04.
//

import UIKit

import SnapKit
import Then

final class SignInView: UIView {
    
    // MARK: - Properties
    
    private var logoImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
