//
//  MainTabBarController.swift
//  Coins
//
//  Created by Дмитрий Игнатьев on 15.07.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white
        
        let firstViewController = UIViewController()
        firstViewController.tabBarItem = UITabBarItem(title: "First", image: UIImage(systemName: "dollarsign.square"), tag: 0)
        
        let secondViewController = UIViewController()
        secondViewController.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "dollarsign.arrow.circlepath"), tag: 1)
        
        let arbitrageViewController = CoinListViewController()
        let navigationController = UINavigationController(rootViewController: arbitrageViewController)
        navigationController.tabBarItem = UITabBarItem(title: "Arbitrage", image: UIImage(systemName: "clock.arrow.2.circlepath"), tag: 2)
        
        let fourthViewController = MenuViewController()
        fourthViewController.tabBarItem = UITabBarItem(title: "Menu", image: UIImage(systemName: "slider.horizontal.3"), tag: 3)
        
        viewControllers = [firstViewController, secondViewController, navigationController, fourthViewController]
    }
}

