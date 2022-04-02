//
//  SecondDataViewController.swift
//  1st-Seminar
//
//  Created by 소연 on 2022/04/02.
//

import UIKit

final class SecondDataViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var dataLabel: UILabel! {
        didSet {
            dataLabel.text = message
        }
    }
    
    ///  아래는 오류가 나더라 -> 왜인지 알아보자.
//    var data: String = "" {
//        didSet {
//            dataLabel.text = data
//        }
//    }
    
    var message: String?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setData()
    }
    
    // MARK: - Custom Method

    private func setData() {
        if let message = message {
            dataLabel.text = message
            dataLabel.sizeToFit()
        }
    }
}
