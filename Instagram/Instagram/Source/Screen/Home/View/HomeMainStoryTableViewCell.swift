//
//  HomeMainStoryTableViewCell.swift
//  Instagram
//
//  Created by 소연 on 2022/04/25.
//

import UIKit

import SnapKit
import Then

final class HomeMainStoryTableViewCell: UITableViewCell {
    static var cellIdentifier: String { return String(describing: self) }
    
    private var storyList = [HomeMainStoryDataModel]()
    
    // MARK: - Properties
    
    private(set) lazy var storyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = .zero
        return UICollectionView(frame: .zero, collectionViewLayout: layout).then {
            $0.backgroundColor = .clear
            $0.isScrollEnabled = true
        }
    }()
    
    private var lineView = UIView().then {
        $0.backgroundColor = .systemGray6
    }
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
        setLayout()
        setCollectionvView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Init UI
    
    private func configUI() {
        contentView.backgroundColor = .white
    }
    
    private func setLayout() {
        contentView.addSubviews([storyCollectionView, lineView])
        
        storyCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(72)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(storyCollectionView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    // MARK: - Custom Method
    
    private func setCollectionvView() {
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        
        storyCollectionView.register(HomeMainStoryCollectionViewCell.self,
                                     forCellWithReuseIdentifier: HomeMainStoryCollectionViewCell.CellIdentifier)
    }
}

// MARK: - UICollectionView Protocols

extension HomeMainStoryTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let cellWidth = width * (58/375)
        let cellHeight = cellWidth * (72/58)
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 11)
    }
}

extension HomeMainStoryTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeMainStoryDataModel.sampleData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMainStoryCollectionViewCell.CellIdentifier, for: indexPath) as? HomeMainStoryCollectionViewCell else { return UICollectionViewCell() }
        cell.setData(HomeMainStoryDataModel.sampleData[indexPath.item])
        return cell
    }
}
