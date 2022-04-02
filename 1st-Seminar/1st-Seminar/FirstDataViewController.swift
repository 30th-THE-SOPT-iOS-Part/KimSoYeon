//
//  FirstDataViewController.swift
//  1st-Seminar
//
//  Created by 소연 on 2022/04/02.
//

import UIKit

final class FirstDataViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAcion
    
    @IBAction func touchUpNextButton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondDataViewController") as? SecondDataViewController else { return }
        nextVC.message = dataTextField.text
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
