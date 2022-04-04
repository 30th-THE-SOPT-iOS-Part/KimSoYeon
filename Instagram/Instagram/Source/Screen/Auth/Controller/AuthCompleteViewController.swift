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
    
    var disposeBag = DisposeBag()
    
    private lazy var navigationBar = IDSNavigationBar(self,
                                                      view: .auth,
                                                      backButtonIsHidden: false,
                                                      closeButtonIsHidden: true)
    
    private lazy var rootView = AuthCompleteView()
    
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
        rootView.tapCompleteObservable
            .withUnretained(self)
            .subscribe(onNext: { (`self`, _ ) in
                let dvc = MainViewController()
                self.navigationController?.pushViewController(dvc, animated: true)
            })
            .disposed(by: disposeBag)
    }
}
