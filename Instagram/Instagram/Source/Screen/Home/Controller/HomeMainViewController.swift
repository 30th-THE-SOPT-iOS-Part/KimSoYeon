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
    
    // MARK: - Properties
    
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setLayout()
    }
    
    // MARK: - InitUI
    
    private func configNavigationBar() {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        
    }
}

