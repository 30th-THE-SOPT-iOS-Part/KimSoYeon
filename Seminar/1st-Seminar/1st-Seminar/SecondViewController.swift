//
//  SecondViewController.swift
//  1st-Seminar
//
//  Created by 소연 on 2022/04/02.
//

import UIKit

final class SecondViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var backButton: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction func touchUpBackButton(_ sender: Any) {
        dismiss(animated: true)
    }
}
