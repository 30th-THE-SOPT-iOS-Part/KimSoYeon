//
//  AuthViewController.swift
//  Instagram
//
//  Created by 소연 on 2022/04/04.
//

import UIKit

import RxSwift

import SnapKit
import Then

final class SignInViewController: UIViewController {
    
    // MARK: - Properties
    
    var disposeBag = DisposeBag()
    
    private lazy var rootView = SignInView()
    
    private lazy var signInView = SignInView()
    private var viewModel = SignInViewModel()
    
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
        
//        view.addSubview(signInView)
//        signInView.snp.makeConstraints {
//            $0.top.left.right.bottom.equalToSuperview()
//        }
//        bindViewModel()
    }
    
    // MARK: - Init UI
    
    private func configNavigationUI() {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubview(rootView)
        rootView.snp.makeConstraints {
            $0.top.left.right.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Custom Method
    
    private func bind() {
        rootView.tapShowPassWordButtonObservable
            .withUnretained(self)
            .subscribe(onNext: { (`self`, _ ) in
                self.rootView.isSelected.toggle()
            })
            .disposed(by: disposeBag)
        
        rootView.tapSignInObservable
            .withUnretained(self)
            .subscribe(onNext: { (`self`, _ ) in
                let vc = AuthCompleteViewController()
                vc.userName = self.rootView.userName
                
                let dvc = UINavigationController(rootViewController: vc)
                dvc.modalPresentationStyle = .fullScreen
                
                self.present(dvc, animated: true)
            })
            .disposed(by: disposeBag)
        
        rootView.tapSignUpObservable
            .withUnretained(self)
            .subscribe(onNext: { (`self`, _ ) in
                let dvc = UserNameViewController()
                self.navigationController?.pushViewController(dvc, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - RxSwift + MVVM
    
    private func bindViewModel() {
        // Bind input
        signInView.idTextField.rx.text.orEmpty
            .bind(to: viewModel.input.id)
            .disposed(by: disposeBag)
        
        signInView.pwTextField.rx.text.orEmpty
            .bind(to: viewModel.input.password)
            .disposed(by: disposeBag)
        
        signInView.signInButton.rx.tap
            .bind(to: viewModel.input.touchUpSignInButton)
            .disposed(by: disposeBag)
        
        // Bind output
        viewModel.output.enableSignInButton
            .observe(on: MainScheduler.instance)
            .bind(to: signInView.signInButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        viewModel.output.pushToMain
            .observe(on: MainScheduler.instance)
            .bind(onNext: pushToMain)
            .disposed(by: disposeBag)
    }
    
    private func pushToMain() {
        let completeViewController = AuthCompleteViewController()
        completeViewController.userName = signInView.userName
        completeViewController.modalPresentationStyle = .fullScreen
        present(completeViewController, animated: true)
    }
}
