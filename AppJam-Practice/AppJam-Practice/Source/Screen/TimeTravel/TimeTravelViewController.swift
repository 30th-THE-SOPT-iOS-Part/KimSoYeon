//
//  ViewController.swift
//  AppJam-Practice
//
//  Created by 소연 on 2022/07/04.
//

import UIKit

import SnapKit
import Then

final class TimeTravelViewController: UIViewController {
    
    // MARK: - Property
    
    private var nextButton = UIButton().then {
        $0.setTitle("shadow_glass_blue", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        
        $0.backgroundColor = .white
        
        $0.layer.cornerRadius = 35
        $0.layer.applySketchShadow(color: UIColor.pointBlue00,
                                   alpha: 1,
                                   x: 0,
                                   y: 0,
                                   blur: 10,
                                   spread: 0)
    }
    
    // MARK: - UI Property
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setUI()
    }
    
    // MARK: - @objc
    
    
    
    // MARK: - Custom Method
    
    private func setLayout() {
        view.addSubview(nextButton)
        
        nextButton.snp.makeConstraints {
            $0.top.leading.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.width.equalTo(170)
            $0.height.equalTo(48)
        }
    }
    
    private func setUI() {
        view.backgroundColor = .white
        
        nextButton.layer.cornerRadius = 4
        nextButton.layer.maskedCorners = [.layerMinXMinYCorner]
        
        nextButton.layer.cornerRadius = 20
        nextButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner]
    }
}

