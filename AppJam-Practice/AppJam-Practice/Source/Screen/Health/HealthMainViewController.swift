//
//  HealthMainViewController.swift
//  AppJam-Practice
//
//  Created by 소연 on 2022/06/24.
//

import UIKit

import Moya

class HealthMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        HealthMainAPI.shared.getHealthMainData { healthData, err in
            guard let healthData = healthData else {
                return
            }
            dump(healthData)
        }
    }
}
