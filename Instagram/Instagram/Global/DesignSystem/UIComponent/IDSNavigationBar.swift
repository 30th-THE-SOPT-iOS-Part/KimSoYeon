//
//  IDSNavigationBar.swift
//  Instagram
//
//  Created by 소연 on 2022/04/04.
//

import Foundation

import SnapKit

final class TDSNavigationBar: UIView {
    
    // MARK: - Metric Enum
    
    public enum Metric {
        static let navigationHeight: CGFloat = 50
        static let titleTop: CGFloat = 13
        static let titleLeading: CGFloat = 25
        static let buttonLeading: CGFloat = 4
        static let buttonTrailing: CGFloat = 7
        static let buttonSize: CGFloat = 44
    }
    
    // MARK: - PageView Enum
    
    public enum PageView {
        case auth
        case home
    }
    
    // MARK: - Properties
    
    private var viewController = UIViewController()
    
    internal var backButton = BackButton()
    internal var closeButton = CloseButton()
    
    private var titleLabel = UILabel().then {
        $0.font = IDSFont.body2
        $0.textColor = .systemGray
        $0.textAlignment = .center
    }
    
    private var viewType: PageView = .home {
        didSet {
            configUI()
        }
    }
    
    // MARK: - Initializer
    
    internal init(_ viewController: UIViewController,
                view: PageView,
                backButtonIsHidden: Bool,
                closeButtonIsHidden: Bool) {
        super.init(frame: .zero)
        self.backButton = BackButton(root: viewController)
        self.closeButton = CloseButton(root: viewController)
        viewType = view
        configUI()
        setLayout()
        setBackButton(isHidden: backButtonIsHidden)
        setCloseButton(isHidden: closeButtonIsHidden)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Init UI
    
    private func configUI() {
        backgroundColor = .white
    }
    
    private func setLayout() {
        addSubviews([backButton,
                     titleLabel,
                     closeButton])
        
        snp.makeConstraints {
            $0.height.equalTo(Metric.navigationHeight)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(Metric.buttonLeading)
            $0.width.height.equalTo(Metric.buttonSize)
        }
        
        titleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(25)
        }
        
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(Metric.buttonTrailing)
            $0.width.height.equalTo(Metric.buttonSize)
        }
    }
    
    // MARK: - Custom Method
    
    private func setBackButton(isHidden: Bool) {
        backButton.isHidden = isHidden
    }
    
    private func setCloseButton(isHidden: Bool) {
        closeButton.isHidden = isHidden
    }
    
    internal func setTitle(title: String) {
        titleLabel.text = title
    }
}

