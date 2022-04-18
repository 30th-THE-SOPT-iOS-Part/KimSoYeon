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
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item == (self.tabBar.items!)[2]{
            UITabBar.appearance().backgroundColor = .black
            UITabBar.appearance().tintColor = .white
            
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .black
            tabBar.standardAppearance = appearance;
            tabBar.scrollEdgeAppearance = self.tabBar.standardAppearance
        } else {
            UITabBar.appearance().backgroundColor = .white
            UITabBar.appearance().tintColor = .black
            
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            tabBar.standardAppearance = appearance;
            tabBar.scrollEdgeAppearance = self.tabBar.standardAppearance
        }
    }
    
    // MARK: - Init UI
    
    private func initUI() {
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().tintColor = .black
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        self.tabBar.standardAppearance = appearance;
        self.tabBar.scrollEdgeAppearance = self.tabBar.standardAppearance
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
