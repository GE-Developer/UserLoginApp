//
//  SceneDelegate.swift
//  UserLoginApp
//
//  Created by M I C H A E L on 31.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        window?.overrideUserInterfaceStyle = .light
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
}
