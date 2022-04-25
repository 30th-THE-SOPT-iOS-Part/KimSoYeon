//
//  ViewController.swift
//  Instagram
//
//  Created by 소연 on 2022/04/04.
//

import UIKit

import SnapKit
import Then

final class HomeMainViewController: UIViewController {
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavigationUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setLayout()
    }
    
    // MARK: - InitUI
    
    private func configNavigationUI() {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configUI() {
        view.backgroundColor = .systemGray2
    }
    
    private func setLayout() {
        
    }
}

