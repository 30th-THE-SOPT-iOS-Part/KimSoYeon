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
    }
    
    private func setLayout() {
        view.addSubview(rootView)
        rootView.snp.makeConstraints {
            $0.top.left.right.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Custom Method
    
    private func bind() {
        rootView.tapSignUpObservable
            .withUnretained(self)
            .subscribe(onNext: { (`self`, _ ) in
                let dvc = UserNameViewController()
                self.navigationController?.pushViewController(dvc, animated: true)
            })
            .disposed(by: disposeBag)
    }
}
