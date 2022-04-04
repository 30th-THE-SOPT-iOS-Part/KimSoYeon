//
//  UserPasswordViewController.swift
//  Instagram
//
//  Created by 소연 on 2022/04/04.
//

import UIKit

import RxSwift

import SnapKit
import Then

final class UserPasswordViewController: UIViewController {
    
    // MARK: - Properties

    var disposeBag = DisposeBag()
    
    private lazy var navigationBar = IDSNavigationBar(self,
                                                      view: .auth,
                                                      backButtonIsHidden: false,
                                                      closeButtonIsHidden: true)
    
    private lazy var rootView = SignUpView()
    
    var userName: String = "" 
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setLayout()
        bind()
    }
    
    // MARK: - Init UI
    
    private func configUI() {
        view.backgroundColor = .white
        
        rootView.isSecureTextEntry = true
    }
    
    private func setLayout() {
        view.addSubviews([navigationBar, rootView])
        
        navigationBar.snp.makeConstraints {
            $0.top.left.right.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(50)
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
                let dvc = AuthCompleteViewController()
                dvc.modalPresentationStyle = .fullScreen
                dvc.userName = self.userName
                self.present(dvc, animated: true)
            })
            .disposed(by: disposeBag)
        
        rootView.title = "비밀번호 만들기"
        rootView.subTitle = "비밀번호를 저장할 수 있으므로 iCloud 기기에서 로그인\n정보를 입력하지 않아도 됩니다."
        rootView.placeHolder = "비밀번호"
    }
}
