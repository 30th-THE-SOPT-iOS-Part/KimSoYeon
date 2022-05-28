//
//  ViewController.swift
//  Instagram
//
//  Created by 소연 on 2022/04/04.
//

import UIKit

import RxSwift

import SnapKit
import Then

final class HomeMainViewController: UIViewController {
    
    // MARK: - Network
    
    private let homeAPI = HomeAPI.shared
    
    // MARK: - Properties
    
    var disposeBag = DisposeBag()
    
    private lazy var rootView = HomeMainView()
    
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
    
    // MARK: - InitUI
    
    private func configNavigationUI() {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubview(rootView)
        
        rootView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func bind() {
        rootView.delegate = self
        
        self.homeAPI.getImageList() { data, err in
            guard let data = data else { return }
            dump(data)
        }
    }
}

// MARK: - Custom Delegate

extension HomeMainViewController: HomeMainViewDelegate {
    func touchUpLikeButton(index: Int) {
        print(index, "is Tapped")
    }
}

