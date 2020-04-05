//
//  CustomTabBarController.swift
//  Nightingale
//
//  Created by Krishnil Bhojani on 01/03/20.
//  Copyright © 2020 AppFactory. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tabBar.barTintColor = #colorLiteral(red: 0.1150266005, green: 0.1186998733, blue: 0.1193884835, alpha: 1)
        tabBar.tintColor = .white
        
        let layout = UICollectionViewFlowLayout()
        let homeViewController = HomeViewController(collectionViewLayout: layout)
        homeViewController.tabBarItem.title = "Home"
        homeViewController.tabBarItem.image = UIImage(named: "home.filled")
        
        let premiumCollectionViewLayout = UICollectionViewFlowLayout()
        premiumCollectionViewLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let premiumViewController = PremiumViewController(collectionViewLayout: premiumCollectionViewLayout)
        premiumViewController.tabBarItem.title = "Premium"
        premiumViewController.tabBarItem.image = UIImage(named: "spotify.filled")
        
        let settingsViewController = SettingsViewController()
        settingsViewController.tabBarItem.title = "Settings"
        settingsViewController.tabBarItem.image = UIImage(named: "settings")
        
        viewControllers = [homeViewController, createDummyVC(title: "Search", imageName: "search.filled"), createDummyVC(title: "Your Library", imageName: "library.filled"), premiumViewController, settingsViewController]
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        .lightContent
    }
    
    func createDummyVC(title: String, imageName: String) -> UIViewController {
        let dummyViewController = UIViewController()
        dummyViewController.view.backgroundColor = .clear
        dummyViewController.tabBarItem.title = title
        dummyViewController.tabBarItem.image = UIImage(named: imageName)
        return dummyViewController
    }

}
