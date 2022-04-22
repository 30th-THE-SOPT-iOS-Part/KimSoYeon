//
//  TabBarController.swift
//  Instagram
//
//  Created by 소연 on 2022/04/19.
//

import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setTabBar()
    }
    
    // MARK: - Init UI
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let items = tabBar.items else { return }
        item == items[2] ? initDarkUI() : initUI()
    }
    
    private func initUI() {
        tabBar.barTintColor = .white
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .black
        tabBar.isTranslucent = false
    }
    
    private func initDarkUI() {
        tabBar.backgroundColor = .black
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .white
        tabBar.isTranslucent = false
    }
    
    // MARK: - Custom Method
    
    private func setTabBar() {
        let homeTab = UINavigationController(rootViewController: HomeMainViewController())
        homeTab.tabBarItem = UITabBarItem(title: "", image: Asset.Assets.icnHome.image, selectedImage: Asset.Assets.icnHomeSelected.image)

        let searchTab = SearchMainViewController()
        searchTab.tabBarItem = UITabBarItem(title: "", image: Asset.Assets.icnSearch.image, selectedImage: Asset.Assets.icnSearchSelected.image)
        
        let reelsTab = ReelsMainViewController()
        reelsTab.tabBarItem = UITabBarItem(title: "", image: Asset.Assets.icnReels.image, selectedImage: Asset.Assets.icnReelsSelected.image)
        
        let shopTab = ShopMainViewController()
        shopTab.tabBarItem = UITabBarItem(title: "", image: Asset.Assets.icnShop.image, selectedImage: Asset.Assets.icnShopSelected.image)
        
        let profileTab = ProfileMainViewController()
        profileTab.tabBarItem = UITabBarItem(title: "", image: Asset.Assets.icnProfile.image, selectedImage: Asset.Assets.icnProfileSelected.image)
        
        let tabs =  [homeTab, searchTab, reelsTab, shopTab, profileTab]
        
        self.setViewControllers(tabs, animated: false)
        self.selectedViewController = homeTab
    }
}
