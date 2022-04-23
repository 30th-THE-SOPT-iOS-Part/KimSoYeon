//
//  ViewController.swift
//  3rd-Seminar
//
//  Created by 소연 on 2022/04/23.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
    }
    
    private func setTextField() {
        textField.delegate = self
    }
    
    // MARK: - IBAciton
    
    @IBAction func touchUpNextButton(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "TextFieldViewController") as? TextFieldViewController else { return }
        dvc.delegate = self
        navigationController?.pushViewController(dvc, animated: true)
    }
}

// MARK: - Cusom Delegate

extension ViewController: TextFieldViewControllerDelegate {
    func sendData(data: String) {
        dataLabel.text = data
    }
}

// MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("START💨")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("✅")
        textField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("END🚬")
    }
}
