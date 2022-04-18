//
//  SignUpView.swift
//  Instagram
//
//  Created by 소연 on 2022/04/04.
//

import UIKit

import RxSwift

import SnapKit
import Then

final class SignUpView: UIView {
    
    // MARK: - Rx Observables
    
    var tapNextObservable: Observable<Void> {
        return nextButton.rx.tapGestureRecognizedVoid()
                    .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
    }
    
    // MARK: - Properties
    
    private var titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = IDSFont.body1
        $0.textAlignment = .center
    }
    
    private var subTitleLabel = UILabel().then {
        $0.textColor = .darkGray
        $0.font = IDSFont.body3
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }
    
    private var textField = IDSTextField().then {
        $0.addLeftPadding()
        $0.clearButtonMode = .whileEditing
    }
    
    private var nextButton = IDSButton().then {
        $0.isEnabled = false
        $0.setTitleWithStyle(title: "다음", size: 15, weight: IDSButton.FontWeight.semiBold)
    }
    
    var title: String = "" {
        didSet {
            titleLabel.text = "\(title)"
        }
    }
    
    var subTitle: String = "" {
        didSet {
            subTitleLabel.text = "\(subTitle)"
        }
    }
    
    var placeHolder: String = "" {
        didSet {
            textField.setPlaceholder(placeholder: "\(placeHolder)")
        }
    }
    
    var isFilled: Bool = false {
        didSet {
            nextButton.isEnabled = isFilled
        }
    }
    
    var isSecureTextEntry: Bool = false {
        didSet {
            textField.isSecureTextEntry = isSecureTextEntry
        }
    }
    
    var textData: String = ""
    
    // MARK: - Initializer
    
    init() {
        super.init(frame: .zero)
        configUI()
        setLayout()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        backgroundColor = .clear
    }
    
    private func setLayout() {
        addSubviews([titleLabel, subTitleLabel, textField, nextButton])
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(6)
            $0.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(19)
            $0.centerX.equalToSuperview()
        }
        
        textField.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(19)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        nextButton.snp.makeConstraints { 
            $0.top.equalTo(textField.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
    }
    
    private func bind() {
        textField.delegate = self
    }
}

extension SignUpView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if textField.hasText {
            nextButton.isEnabled = true
            guard let text = textField.text else { return }
            textData = text
        } else {
            nextButton.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
