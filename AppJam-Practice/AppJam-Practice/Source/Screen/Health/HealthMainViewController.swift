//
//  HealthMainViewController.swift
//  AppJam-Practice
//
//  Created by 소연 on 2022/06/24.
//

import UIKit

import SnapKit
import Then

import Moya

final class HealthMainViewController: UIViewController {

    // MARK: - Properties
    
    private var weightTextField = UITextField().then {
        $0.placeholder = "체중을 입력해주세요"
    }
    
    private var fatPercentTextField = UITextField().then {
        $0.placeholder = "체지방량을 입력해주세요"
    }
    
    private var muscleTextField = UITextField().then {
        $0.placeholder = "근육량을 입력해주세요"
    }
    
    private var memoTextField = UITextField().then {
        $0.placeholder = "메모를 남겨주세요"
    }
    
    private lazy var uploadButton = UIButton().then {
        $0.setTitle("올려올려", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
        $0.addTarget(self, action: #selector(touchUpButton), for: .touchUpInside)
    }
    
    private var weight: Double?
    private var fatPercent: Double?
    private var muslce: Double?
    private var memo: String?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setupLayout()
//        getMainData()22.7
    }
    
    // MARK: - UI
    
    private func configUI() {
        view.backgroundColor = .white
    }
    
    private func setupLayout() {
        view.addSubview(weightTextField)
        view.addSubview(fatPercentTextField)
        view.addSubview(muscleTextField)
        view.addSubview(memoTextField)
        view.addSubview(uploadButton)
        
        weightTextField.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(50)
        }
        
        fatPercentTextField.snp.makeConstraints {
            $0.top.equalTo(weightTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(50)
        }
        
        muscleTextField.snp.makeConstraints {
            $0.top.equalTo(fatPercentTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(50)
        }
        
        memoTextField.snp.makeConstraints {
            $0.top.equalTo(muscleTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(50)
        }
        
        uploadButton.snp.makeConstraints {
            $0.top.equalTo(memoTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Network
    
    private func getMainData() {
        HealthMainAPI.shared.getHealthMainData { healthData, err in
            guard let healthData = healthData else {
                return
            }
            dump(healthData)
        }
    }
    
    private func postWeight() {
        if let weight = weightTextField.text {
            guard let weight = Double(weight) else { return }
            let param = HealthWeight(weight: weight, fatPercent: 1.0, muscle: 1.0, memo: "어쩌고")
            HealthWeightAPI.shared.postWeightData(param: param) { weightData, err in
                guard let weightData = weightData else {
                    return
                }
                dump(weightData)
            }
        }
    }
    
    // MARK: - @objc
    
    @objc func touchUpButton() {
        print("버튼 누름")
        postWeight()
    }
}
