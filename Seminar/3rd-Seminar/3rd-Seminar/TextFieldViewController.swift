//
//  TextFieldViewController.swift
//  3rd-Seminar
//
//  Created by 소연 on 2022/04/23.
//

import UIKit

protocol TextFieldViewControllerDelegate: ViewController {
    func sendData(data: String)
}

class TextFieldViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    
    weak var delegate: TextFieldViewControllerDelegate?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction func touchUpBackButton(_ sender: Any) {
        if let text = textField.text {
            delegate?.sendData(data: text)
        }
        navigationController?.popViewController(animated: true)
    }
}
