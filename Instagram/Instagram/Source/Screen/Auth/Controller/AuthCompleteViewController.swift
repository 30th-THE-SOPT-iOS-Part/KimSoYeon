//
//  AuthCompleteViewController.swift
//  Instagram
//
//  Created by 소연 on 2022/04/04.
//

import UIKit

import RxSwift

import SnapKit
import Then

final class AuthCompleteViewController: UIViewController {
    
    // MARK: - Network
        
    private let signUpAPI = SignUpAPI.shared
    
    // MARK: - Properties
    
    var disposeBag = DisposeBag()
    
    private lazy var navigationBar = IDSNavigationBar(self,
                                                      view: .auth,
                                                      backButtonIsHidden: true,
                                                      closeButtonIsHidden: true)
    
    private lazy var rootView = AuthCompleteView()
    
    var userName: String = "" {
        didSet {
            rootView.userName = userName
        }
    }
    
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
        rootView.tapCompleteObservable
            .throttleOnBackground(.seconds(1))
            .observeOnMain()
            .withUnretained(self)
            .subscribe(onNext: { (`self`, _ ) in
                self.signUpAPI.signUp(parameter: SignUpRequest(name: AuthModel.name, email: AuthModel.email, password: AuthModel.password)) { data, err in
                    guard let data = data else {
                        return
                    }
                    self.alert(message: "회원가입 성공")
                }
            })
            .disposed(by: disposeBag)
        
        rootView.tapSwitchObservable
            .withUnretained(self)
            .subscribe(onNext: { (`self`, _ ) in
                guard let parentVC = self.presentingViewController as? UINavigationController else { return }
                self.dismiss(animated: true) {
                    parentVC.dismiss(animated: true)
                }
            })
            .disposed(by: disposeBag)
    }
    
    func alert(message: String) {
        let alertVC = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { action in
            print("action")
            self.navigationController?.popViewController(animated: true)
        }
        alertVC.addAction(okAction)
        present(alertVC, animated: true)
    }
}

// MARK: - Network

extension AuthCompleteViewController {
    
}
