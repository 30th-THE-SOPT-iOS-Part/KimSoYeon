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
    
    private var countScrollLabel = CountScrollLabel().then {
        $0.isHidden = false
    }
    private var label = UILabel().then {
        $0.text = "2022"
        $0.font = .boldSystemFont(ofSize: 20)
        $0.isHidden = true
    }
    
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
        view.addSubview(label)
        view.addSubview(countScrollLabel)
        view.addSubview(button)
        
        label.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.leading.equalToSuperview().inset(10)
        }
        
        countScrollLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.leading.equalToSuperview().inset(10)
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(countScrollLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(10)
        }
    }
    
    // MARK: - @objc
    
    @objc func touchUpButton() {
//        label.isHidden = true
//        countScrollLabel.isHidden = false
        countScrollLabel.animate(ascending: true)
    }
    
}
