//
//  DDSButton.swift
//  AppJam-Practice
//
//  Created by 소연 on 2022/07/06.
//

import UIKit

public class DDSButton: UIButton {
    
    // MARK: - Property
        
    public var title: String? {
        didSet {
            setTitle(title, for: .normal)
        }
    }
    
    public var isDisabled: Bool = false {
        didSet {
            isEnabled = !isDisabled
            setColor()
        }
    }

    // MARK: - Initialize
    
    public init() {
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set UI
    
    private func setUI() {
        titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        
        roundCorners(corners: [.topLeft], radius: 4)
        roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 20)
        
        setTitleColor(.white, for: .normal)
        setTitleColor(.pointBlue00, for: .highlighted)
        setColor()
    }
    
    private func setLayout() {
        snp.makeConstraints { make in
            make.height.equalTo(Matrix.buttonHeight)
        }
    }
    
    private func setColor() {
        backgroundColor = .white
        
        if isDisabled {
            backgroundColor = .systemGray4
        }
    }
}
