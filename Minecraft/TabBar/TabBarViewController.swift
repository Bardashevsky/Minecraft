//
//  TabBarViewController.swift
//  Minecraft
//
//  Created by Oleksandr Bardashevskyi on 27.09.2020.
//

import UIKit



class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.barTintColor = .tabBarColor
        self.tabBar.unselectedItemTintColor = .gray
        self.tabBar.tintColor = .white
        self.setViewControllers(setupBarButtons(), animated: true)
    }
    
    private func setupBarButtons() -> [UIViewController] {
        let mapController = MapsViewController()
        mapController.tabBarItem = UITabBarItem(title: "Карты", image: UIImage(named: "unMap")!.withRenderingMode(.alwaysOriginal),
                                                selectedImage: UIImage(named: "seMap")!.withRenderingMode(.alwaysOriginal))
        
        let favoriteController = FavoriteViewController()
        favoriteController.tabBarItem = UITabBarItem(title: "Избранное", image: UIImage(named: "unFav")!.withRenderingMode(.alwaysOriginal),
                                                     selectedImage: UIImage(named: "seFav")!.withRenderingMode(.alwaysOriginal))
        
        let guideController = GuideViewController()
        guideController.tabBarItem = UITabBarItem(title: "Гайд", image: UIImage(named: "unGuide")!.withRenderingMode(.alwaysOriginal),
                                                  selectedImage: UIImage(named: "seGuide")!.withRenderingMode(.alwaysOriginal))
        
        
        return [mapController, favoriteController, guideController]
    }
}
