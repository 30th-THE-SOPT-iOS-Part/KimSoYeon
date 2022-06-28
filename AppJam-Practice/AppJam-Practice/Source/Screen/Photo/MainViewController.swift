//
//  ViewController.swift
//  AppJam-Practice
//
//  Created by 소연 on 2022/06/20.
//

import UIKit

import Photos
import PhotosUI

import SnapKit
import Then

class MainViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    private var countDownLabel = CountScrollLabel()
    
    private lazy var button = UIButton().then {
        $0.setTitle("버튼", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
        $0.addTarget(self, action: #selector(touchUpCountDownButton), for: .touchUpInside)
    }
    
    private let dateFormatter = DateFormatter().then {
        $0.locale = Locale(identifier: "ko_kr")
        $0.timeZone = TimeZone(abbreviation: "ko_kr")
        $0.dateFormat = "yyyy.MM.dd"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(countDownLabel)
        view.addSubview(button)
        
        countDownLabel.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(80)
            $0.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(countDownLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        countDownLabel.config(num: "2017", duration: 0.5)
    }
    
    @IBAction func touchUpButton(_ sender: Any) {
        if #available(iOS 14, *) {
            pickImage()
        } else {
            openGallery()
        }
    }
    
    private func pickImage() {
        var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        config.filter = .images
        config.selectionLimit = 1
        let controller = PHPickerViewController(configuration: config)
        
        controller.delegate = self
        self.present(controller, animated: true, completion: nil)
    }
    
    private func openGallery() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    
    // MARK: - @objc
    
    @objc func touchUpCountDownButton() {
        countDownLabel.animate(ascending: true)
    }
}

extension MainViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true) // 1
        guard !results.isEmpty else {
            return
        }
        
        let imageResult = results[0]
        
        if let assetId = imageResult.assetIdentifier {
            let assetResults = PHAsset.fetchAssets(withLocalIdentifiers: [assetId], options: nil)
            DispatchQueue.main.async {
                if let date = assetResults.firstObject?.creationDate {
                    self.dateLabel.text = self.dateFormatter.string(from: date)
                }
                print(assetResults.firstObject?.location?.coordinate ?? "None-Cooridinate")
            }
        }
        if imageResult.itemProvider.canLoadObject(ofClass: UIImage.self) {
            imageResult.itemProvider.loadObject(ofClass: UIImage.self) { (selectedImage, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    DispatchQueue.main.async {
                        self.imageView.image = selectedImage as? UIImage
                    }
                }
            }
        }
    }
    
}

extension MainViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = image
        }
        if let asset = info[.phAsset] as? PHAsset {
            print(asset.creationDate ?? "None")
        }
        dismiss(animated: true, completion: nil)
    }
}
