//
//  SignInView.swift
//  Instagram
//
//  Created by 소연 on 2022/04/04.
//

import UIKit

import RxSwift

import SnapKit
import Then

final class SignInView: UIView {
    
    // MARK: - Rx Observables
    
    var tapSignUpObservable: Observable<Void> {
        return signUpButton.rx.tapGestureRecognizedVoid()
                    .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
    }
    
    // MARK: - Properties
    
    private var logoImageView = UIImageView().then {
        $0.image = Asset.Assets.instagramBlackLogo.image
        $0.contentMode = .scaleAspectFit
    }
    
    private var textFieldStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
        $0.distribution = .fillEqually
        $0.alignment = .fill
    }
    
    private var idTextField = IDSTextField().then {
        $0.setPlaceholder(placeholder: "전화번호, 사용자 이름 또는 이메일")
    }
    private var pwTextField = IDSTextField().then {
        $0.setPlaceholder(placeholder: "비밀번호")
        $0.isSecureTextEntry = true
    }
    
    private var pwGuideButton = UIButton().then {
        $0.titleLabel?.text = "비밀번호를 잊어버리셨나요?"
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = IDSFont.body3
    }
    
    var loginButton = IDSButton().then {
        $0.isActivated = false
        $0.setTitleWithStyle(title: "로그인", size: 15, weight: IDSButton.FontWeight.semiBold)
    }
    
    private var guideLabel = UILabel().then {
        $0.text = "계정이 없으신가요?"
        $0.textColor = .lightGray
        $0.font = IDSFont.body4
    }
    
    private lazy var signUpButton = UIButton().then {
        $0.setTitle("가입하기", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = IDSFont.body4
    }
    
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
    
    // MARK: - Init UI
    
    private func configUI() {
        backgroundColor = .white
        
        [idTextField, pwTextField].forEach {
            $0.addLeftPadding()
        }
    }
    
    private func setLayout() {
        addSubviews([logoImageView,
                     textFieldStackView,
                     pwGuideButton,
                     loginButton,
                     guideLabel,
                     signUpButton])
        
        textFieldStackView.addArrangedSubview(idTextField)
        textFieldStackView.addArrangedSubview(pwTextField)

        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(30)
            $0.leading.trailing.equalToSuperview().inset(90)
            $0.height.equalTo(120)
        }
        
        textFieldStackView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(110)
        }
        
        pwGuideButton.snp.makeConstraints {
            $0.top.equalTo(textFieldStackView.snp.bottom).offset(7)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(pwGuideButton.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        guideLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(110)
        }
        
        signUpButton.snp.makeConstraints {
            $0.centerY.equalTo(guideLabel.snp.centerY)
            $0.leading.equalTo(guideLabel.snp.trailing).offset(7)
        }
    }
    
    private func bind() {
        idTextField.delegate = self
        pwTextField.delegate = self
    }
}

extension SignInView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if idTextField.hasText && pwTextField.hasText {
            loginButton.isActivated = true
        } else {
            loginButton.isActivated = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
