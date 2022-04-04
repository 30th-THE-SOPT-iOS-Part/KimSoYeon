//
//  FirstViewController.swift
//  1st-Seminar
//
//  Created by 소연 on 2022/04/02.
//

import UIKit

final class FirstViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction func touchUpNextButton(_ sender: Any) {
        /// modal로 화면 전환
//        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") else { return }
//        nextVC.modalPresentationStyle = .fullScreen
//        nextVC.modalTransitionStyle = .coverVertical
//        present(nextVC, animated: true, completion: nil)
        
        /// navigation으로 화면 전환
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") else { return }
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
