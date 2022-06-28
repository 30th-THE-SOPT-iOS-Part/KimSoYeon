//
//  CountingAnimationViewController.swift
//  AppJam-Practice
//
//  Created by 소연 on 2022/06/29.
//

import UIKit

import SnapKit
import Then

class CountingAnimationViewController: UIViewController {
    
    private var countingLabel = CountingLabel().then {
        $0.text = "2022"
    }
    
    private lazy var countingButton = UIButton().then {
        $0.setTitle("눌러", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.addTarget(self, action: #selector(touchUpButton), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(countingLabel)
        view.addSubview(countingButton)
        
        countingLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(100)
            $0.centerX.equalToSuperview()
        }
        
        countingButton.snp.makeConstraints {
            $0.top.equalTo(countingLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc func touchUpButton() {
        countingLabel.count(fromValue: 2022, to: 2017, withDuration: 5, andAnimationType: .easeOut, andCounterType: .int)
    }
}
