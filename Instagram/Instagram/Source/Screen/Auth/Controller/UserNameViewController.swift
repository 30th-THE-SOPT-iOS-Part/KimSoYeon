//
//  SignUpViewController.swift
//  Instagram
//
//  Created by 소연 on 2022/04/04.
//

import UIKit

import RxSwift

import SnapKit
import Then

final class UserNameViewController: UIViewController {
    
    // MARK: - Properties

    var disposeBag = DisposeBag()
    
    private lazy var navigationBar = IDSNavigationBar(self,
                                                      view: .auth,
                                                      backButtonIsHidden: false,
                                                      closeButtonIsHidden: true)
    
    private lazy var rootView = SignUpView()
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavigationUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setLayout()
        bind()
    }
    
    // MARK: - Init UI
    
    private func configNavigationUI() {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews([navigationBar, rootView])
        
        navigationBar.snp.makeConstraints {
            $0.top.left.right.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(IDSNavigationBar.Metric.navigationHeight)
        }
        
        rootView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Custom Method
    
    private func bind() {
        rootView.tapNextObservable
            .withUnretained(self)
            .subscribe(onNext: { (`self`, _ ) in
                let passwordViewController = UserPasswordViewController()
                AuthModel.email = self.rootView.textData
                self.navigationController?.pushViewController(passwordViewController, animated: true)
            })
            .disposed(by: disposeBag)
        
        rootView.title = "사용자 이름 만들기"
        rootView.subTitle = "새 계정에 사용할 사용자 이름을 선택하세요. 나중에\n언제든지 변경할 수 있습니다."
        rootView.placeHolder = "사용자 이름"
    }
}
