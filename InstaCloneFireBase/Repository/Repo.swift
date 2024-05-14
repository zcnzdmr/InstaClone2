//
//  Repo.swift
//  InstaCloneFireBase
//
//  Created by Özcan on 8.05.2024.
//

import Foundation
import UIKit


class Repo  {
    
    func gecis() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let tabbar = UITabBarController()
        
        let firstVC = UINavigationController(rootViewController: HomePage())
        let secondVC = UINavigationController(rootViewController: FourPage())
        let thirdVC = UINavigationController(rootViewController: FivePage())
        let forthVC = UINavigationController(rootViewController: SecondPage())
        let fifthVC = UINavigationController(rootViewController: ThirdPage())

        firstVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"),selectedImage: UIImage(systemName: "house.fill"))
        secondVC.tabBarItem = UITabBarItem(title: "Network", image: UIImage(systemName: "person.line.dotted.person"), selectedImage: UIImage(systemName: "person.line.dotted.person.fill"))
        thirdVC.tabBarItem =  UITabBarItem(title: "Profile", image: UIImage(systemName: "person"),selectedImage: UIImage(systemName: "person.fill"))
        forthVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass.circle"), selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
        fifthVC.tabBarItem = UITabBarItem(title: "Add", image: UIImage(systemName: "video"), selectedImage: UIImage(systemName: "video.fill"))

        tabbar.viewControllers = [firstVC,forthVC,fifthVC, secondVC,thirdVC ]
//        tabbar.tabBar.backgroundColor = UIColor.systemOrange
        appDelegate.window?.rootViewController = tabbar
    }
}
