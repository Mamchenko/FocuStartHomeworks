//
//  SceneDelegate.swift
//  CarList_CFT_HW1
//
//  Created by Anatoliy Mamchenko on 19.04.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        let startVC = ListViewController()
        let navigationVC = UINavigationController(rootViewController: startVC)
        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationVC
    }
}

