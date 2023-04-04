//
//  ViewController.swift
//  TestTabBar5
//
//  Created by 김재훈 on 2023/04/04.
//

import UIKit

class ViewController: UITabBarController {

    var vc1: UIViewController = {
        let v = UIViewController()
        v.view.backgroundColor = .yellow
        v.tabBarItem = UITabBarItem(title: "home1", image: UIImage(systemName: "house"), tag: 0)
        return v
    }()
    
    var vc2: UIViewController = {
        let v = UIViewController()
        v.view.backgroundColor = .red
        v.tabBarItem = UITabBarItem(title: "home2", image: UIImage(systemName: "house"), tag: 1)
        return v
    }()
    
    var vc3: UIViewController = {
        let v = UIViewController()
        v.view.backgroundColor = .blue
        v.tabBarItem = UITabBarItem(title: "home3", image: UIImage(systemName: "house"), tag: 2)
        return v
    }()
    
    var vc4: UIViewController = {
        let v = UIViewController()
        v.view.backgroundColor = .green
        v.tabBarItem = UITabBarItem(title: "home4", image: UIImage(systemName: "house"), tag: 3)
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UITabBar.appearance().backgroundColor = .lightGray
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        changeRadiusOfTabbar()
        changeUnSelectedColor()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        changeHeightOfTabbar()
    }

    func changeRadiusOfTabbar() {
        tabBar.layer.masksToBounds = true
        tabBar.isTranslucent = true
        tabBar.layer.cornerRadius = 50
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func changeUnSelectedColor() {
        tabBar.unselectedItemTintColor = UIColor.purple
    }
    
    func changeHeightOfTabbar() {
        if UIDevice().userInterfaceIdiom == .phone {
            var tabFrame = tabBar.frame
            tabFrame.size.height = 100
            tabFrame.origin.y = view.frame.size.height - 100
            tabBar.frame = tabFrame
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        simpleAnimationWhenSelection(item)
        handleAnimationWhenSelectionItem(item)
    }
    
    func simpleAnimationWhenSelection(_ item: UITabBarItem) {
        guard let barItemView = item.value(forKey: "view") as? UIView else { return }
        
        let timeInterval: TimeInterval = 0.5
        let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 1.9, y: 1.9)
        }
        propertyAnimator.addAnimations ({ barItemView.transform = .identity }, delayFactor: CGFloat(timeInterval))
        propertyAnimator.startAnimation()
    }
    
    func handleAnimationWhenSelectionItem(_ item: UITabBarItem) {
        if item == (tabBar.items!)[0] {
            print("Technicalisto : index 0")
        }
        else if item == (tabBar.items!)[1] {
            print("Technicalisto : index 1")
        }
    }
}

