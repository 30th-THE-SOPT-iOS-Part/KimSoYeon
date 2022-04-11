//
//  CloseButton.swift
//  Instagram
//
//  Created by 소연 on 2022/04/04.
//

import UIKit

import SnapKit

final class CloseButton: UIButton {
                
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
        setupLayout()
    }
    
    convenience init(root: UIViewController) {
        self.init()
        setupAction(vc: root)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Init UI
    
    private func configUI() {
        setImage(UIImage(named: "icnClose"), for: .normal)
    }
    
    private func setupLayout() {
        self.snp.makeConstraints { make in
            make.width.height.equalTo(44)
        }
    }
    
    // MARK: - Custom Method
    
    private func setupAction(vc: UIViewController) {
        let closeAction = UIAction { _ in
            vc.dismiss(animated: true, completion: nil)
        }
        self.addAction(closeAction, for: .touchUpInside)
    }
}
