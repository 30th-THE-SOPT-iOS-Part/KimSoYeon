//
//  CustomTabBarController.swift
//  2nd-Seminar
//
//  Created by 소연 on 2022/04/09.
//

import UIKit

final class CustomTabBarController: UITabBarController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setTabBarController()
    }
    
    // MARK: - InitUI
    
    private func configUI() {
        view.backgroundColor = .white
    }
    
    // MARK: - Custom Method
    
    private func setTabBarController() {
        guard let firstViewController = storyboard?.instantiateViewController(withIdentifier: "FirstViewController"),
              let secondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") else { return }
        
        firstViewController.tabBarItem = UITabBarItem(title: "",
                                                      image: UIImage(named: "Home_White"),
                                                      selectedImage: UIImage(named: "Home"))
        
        secondViewController.tabBarItem = UITabBarItem(title: "",
                                                      image: UIImage(named: "User_White"),
                                                      selectedImage: UIImage(named: "User"))
        
        setViewControllers([firstViewController, secondViewController], animated: true)
    }
}
