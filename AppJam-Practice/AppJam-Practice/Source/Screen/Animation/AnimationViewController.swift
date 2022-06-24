//
//  AnimationViewController.swift
//  AppJam-Practice
//
//  Created by 소연 on 2022/06/25.
//

import UIKit

import SnapKit
import Then

final class AnimationViewController: UIViewController {

    // MARK: - Properties
    
    private var countScrollLabel = CountScrollLabel()
    
    private lazy var button = UIButton().then {
        $0.setTitle("버튼", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
        $0.addTarget(self, action: #selector(touchUpButton), for: .touchUpInside)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setLayout()
    }
    
    // MARK: - Init UI
    
    private func configUI() {
        view.backgroundColor = .white
        
        countScrollLabel.config(num: "2017", duration: 1.5)
    }
    
    private func setLayout() {
        view.addSubview(countScrollLabel)
        view.addSubview(button)
        
        countScrollLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(countScrollLabel.snp.bottom).offset(100)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - @objc
    
    @objc func touchUpButton() {
        countScrollLabel.animate(ascending: true)
    }
    
}
