//
//  MainTabBar.swift
//  Spinx allp
//
//  Created by BSergio on 18.04.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupItems()
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .specialYeloow
        tabBar.tintColor = .specialDarkGrey
        tabBar.unselectedItemTintColor = .specialLightGray
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.specialLightGray.cgColor
    }
    
    private func setupItems() {
        let mainVC = MainViewController()
        let menuVC = MenuViewController()
        let aboutVC = AboutViewController()
        
        let menuNC = UINavigationController(rootViewController: menuVC)
        let mainNc = UINavigationController(rootViewController: mainVC)
        
        setViewControllers([mainNc, menuNC, aboutVC], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Home"
        items[1].title = "Menu"
        items[2].title = "Info"
        
        items[0].image = UIImage(systemName: "house.fill")

        items[1].image = UIImage(systemName: "menucard.fill")
        items[2].image = UIImage(systemName: "info.circle.fill")
        
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont(name: "Roboto-Bold", size: 12) as Any], for: .normal)
    }
}
