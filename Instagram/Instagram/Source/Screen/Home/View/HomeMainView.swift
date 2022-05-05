//
//  HomeMainView.swift
//  Instagram
//
//  Created by 소연 on 2022/04/04.
//

import UIKit

import SnapKit
import Then

protocol HomeMainViewDelegate: AnyObject {
    func touchUpLikeButton(index: Int)
}

final class HomeMainView: UIView {
    
    private var navigationBar = UIView().then {
        $0.backgroundColor = .white
    }
    
    private var logoImageView = UIImageView().then {
        $0.image = Asset.Assets.instagramBlackLogo.image
    }
    
    private var buttonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }
    
    private var addButton = UIButton().then {
        $0.setTitle("", for: .normal)
        $0.setImage(Asset.Assets.icnAdd.image, for: .normal)
    }
    
    private var likeButton = UIButton().then {
        $0.setTitle("", for: .normal)
        $0.setImage(Asset.Assets.icnUnlike.image, for: .normal)
    }
    
    private var shareButton = UIButton().then {
        $0.setTitle("", for: .normal)
        $0.setImage(Asset.Assets.icnShare.image, for: .normal)
    }
    
    private var contentTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        
        $0.register(HomeMainContentTableViewCell.self,
                                  forCellReuseIdentifier: HomeMainContentTableViewCell.cellIdentifier)
        $0.register(HomeMainStoryTableViewCell.self,
                                  forCellReuseIdentifier: HomeMainStoryTableViewCell.cellIdentifier)
    }
    
    weak var delegate: HomeMainViewDelegate?
    
    // MARK: - Initializer
    
    init() {
        super.init(frame: .zero)
        configUI()
        setLayout()
        setTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Init UI
    
    private func configUI() {
        backgroundColor = .white
    }
    
    private func setLayout() {
        addSubviews([navigationBar, contentTableView])
        
        navigationBar.addSubviews([logoImageView, buttonStackView])
        
        buttonStackView.addArrangedSubview(addButton)
        buttonStackView.addArrangedSubview(likeButton)
        buttonStackView.addArrangedSubview(shareButton)
        
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(36)
        }
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(9)
            $0.leading.equalToSuperview().inset(14)
            $0.width.equalTo(96)
            $0.height.equalTo(27)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.trailing.equalToSuperview().inset(14)
            $0.width.equalTo(104)
            $0.height.equalTo(24)
        }
        
        contentTableView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.top.equalTo(navigationBar.snp.bottom)
        }
    }
    
    // MARK: - Custom Method
    
    private func setTableView() {
        contentTableView.delegate = self
        contentTableView.dataSource = self
    }
}

// MARK: - UITableView Protocols

extension HomeMainView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 93
        case 1:
            return 488
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            print("Story View")
        case 1:
            print("Content View")
        default:
            print("Default")
        }
    }
}

extension HomeMainView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return HomeMainContentDataModel.sampleData.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeMainStoryTableViewCell.cellIdentifier, for: indexPath) as? HomeMainStoryTableViewCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeMainContentTableViewCell.cellIdentifier, for: indexPath) as? HomeMainContentTableViewCell else { return UITableViewCell() }
            cell.index = indexPath.row
            cell.setData(HomeMainContentDataModel.sampleData[indexPath.row])
            cell.delegate = self
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - Cusom Delegate

extension HomeMainView: HomeMainContentTableViewCellDelegate {
    func touchUpLikeButton(index: Int) {
        delegate?.touchUpLikeButton(index: index)
    }
}
