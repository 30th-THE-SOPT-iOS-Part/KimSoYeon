//
//  MusicTableViewCell.swift
//  3rd-Seminar
//
//  Created by 소연 on 2022/04/23.
//

import UIKit

final class MusicTableViewCell: UITableViewCell {
    static var CellIdentifier: String { return String(describing: self) }
    
    // MARK: - Properties
    
    @IBOutlet weak var albumCoverImageView: UIImageView!
    
    @IBOutlet weak var musicTitleLabel: UILabel!
    @IBOutlet weak var musicDescriptionLabel: UILabel!
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Custom Method
    
    internal func initCell(_ musicData: MusicDataModel) {
        albumCoverImageView.image = musicData.albumImage
        musicTitleLabel.text = musicData.musicTitle
        musicDescriptionLabel.text = musicData.description
    }
}
