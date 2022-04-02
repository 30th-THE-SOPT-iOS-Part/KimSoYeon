//
//  ViewController.swift
//  1st-Seminar
//
//  Created by 소연 on 2022/04/02.
//

import UIKit
import AVFoundation

final class ViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var hureeLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    // MARK: - Custom Method
    
    private func bind() {
        heartButton.addTarget(self, action: #selector(touchUpSeartButton), for: .touchUpInside)
    }
    
    // MARK: - @objc
    
    @objc func touchUpSeartButton() {
        hureeLabel.text = "huree 💜 sokyte"
        AudioServicesPlayAlertSound(SystemSoundID(1307))
    }
}

