//
//  ImageViewController.swift
//  AppJam-Practice
//
//  Created by 소연 on 2022/06/24.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            guard let fullImageURLString = await APIManager.shared.fullImageURLs.randomElement() else { return }
            guard let imageURL = URL(string: fullImageURLString) else { return }
            let imageData = try Data(contentsOf: imageURL)
            imageView.image = UIImage(data: imageData)
        }
    }
}
