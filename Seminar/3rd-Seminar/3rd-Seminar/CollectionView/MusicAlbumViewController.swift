//
//  MusicAlbumViewController.swift
//  3rd-Seminar
//
//  Created by 소연 on 2022/04/23.
//

import UIKit

final class MusicAlbumViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
    }
    
    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: MusicCollectionViewCell.CellIdentifier, bundle: nil), forCellWithReuseIdentifier: MusicCollectionViewCell.CellIdentifier)
    }
}

extension MusicAlbumViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (176/375)
        let cellHeight = cellWidth * (213/176)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 10, bottom: 10, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
}

extension MusicAlbumViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AlbumDataModel.sampleData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicCollectionViewCell.CellIdentifier, for: indexPath) as? MusicCollectionViewCell else { return UICollectionViewCell() }
        cell.initCell(albumData: AlbumDataModel.sampleData[indexPath.item])
        return cell
    }
}
