//
//  MusicCollectionViewCell.swift
//  3rd-Seminar
//
//  Created by 소연 on 2022/04/23.
//

import UIKit

class MusicCollectionViewCell: UICollectionViewCell {
    static var CellIdentifier: String { return String(describing: self) }

    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    internal func initCell(albumData : AlbumDataModel) {
        albumImageView.image = UIImage(named: albumData.albumImageName)
        albumTitleLabel.text = albumData.albumTitle
        singerLabel.text = albumData.albumSinger
    }

}
