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
    
    var tapSignInObservable: Observable<Void> {
        return signInButton.rx.tapGestureRecognizedVoid()
                    .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
    }
    
    var tapSignUpObservable: Observable<Void> {
        return signUpButton.rx.tapGestureRecognizedVoid()
                    .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
    }
    
    var tapShowPassWordButtonObservable: Observable<Void> {
        return showPassWordButton.rx.tapGestureRecognizedVoid()
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
        $0.clearButtonMode = .whileEditing
    }
    
    private var pwTextField = IDSTextField().then {
        $0.setPlaceholder(placeholder: "비밀번호")
        $0.isSecureTextEntry = true
    }
    
    private var showPassWordButton = UIButton().then {
        $0.setTitle("", for: .selected)
        $0.setTitle("", for: .normal)
        $0.setImage(Asset.Assets.passwordShownEyeIcon.image, for: .selected)
        $0.setImage(Asset.Assets.passwordHiddenEyeIcon.image, for: .normal)
    }
    
    private var pwGuideButton = UIButton().then {
        $0.titleLabel?.text = "비밀번호를 잊어버리셨나요?"
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = IDSFont.body3
    }
    
    var signInButton = IDSButton().then {
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
    
    var userName: String = ""
    
    var isSelected: Bool = true {
        didSet {
            showPassWordButton.isSelected = isSelected
            showPassWordButton.isSelected ? (pwTextField.isSecureTextEntry = false) : (pwTextField.isSecureTextEntry = true)
        }
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
                     signInButton,
                     guideLabel,
                     signUpButton])
        
        textFieldStackView.addArrangedSubview(idTextField)
        textFieldStackView.addArrangedSubview(pwTextField)
        
        pwTextField.addSubview(showPassWordButton)
        showPassWordButton.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview().inset(5)
            $0.width.height.equalTo(20)
        }

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
        
        signInButton.snp.makeConstraints {
            $0.top.equalTo(pwGuideButton.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        guideLabel.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).offset(20)
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
            signInButton.isActivated = true
            guard let text = idTextField.text else { return }
            userName = text
        } else {
            signInButton.isActivated = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
