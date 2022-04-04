//
//  AuthView.swift
//  Instagram
//
//  Created by 소연 on 2022/04/04.
//

import UIKit

import RxSwift

import SnapKit
import Then

final class AuthCompleteView: UIView {
    
    // MARK: - Rx Observables
    
    var tapCompleteObservable: Observable<Void> {
        return completeButton.rx.tapGestureRecognizedVoid()
                    .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
    }
    
    private var titlLabel = UILabel().then {
        $0.text = "님, Instagram에\n오신 것을 환영합니다."
        $0.textColor = .darkGray
        $0.font = IDSFont.body1
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }
    
    private var subTitleLabel = UILabel().then {
        $0.text = "언제든지 연락처 정보와 사용자 이름을 변경할 수 있습니다."
        $0.textColor = .systemGray3
        $0.font = IDSFont.body5
    }
    
    private var completeButton = IDSButton().then {
        $0.isActivated = true
        $0.setTitleWithStyle(title: "완료", size: 15, weight: IDSButton.FontWeight.semiBold)
    }
    
    var userName: String = "" {
        didSet {
            titlLabel.text = "\(userName)님, Instagram에\n오신 것을 환영합니다."
        }
    }
    
    // MARK: - Initializer
    
    init() {
        super.init(frame: .zero)
        configUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Init UI
    
    private func configUI() {
        
    }
    
    private func setLayout() {
        addSubviews([titlLabel, subTitleLabel, completeButton])
        
        titlLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(100)
            $0.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titlLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        completeButton.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
        }
    }
}
