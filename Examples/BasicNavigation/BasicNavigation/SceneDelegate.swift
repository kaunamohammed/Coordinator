//
//  SceneDelegate.swift
//  BasicNavigation
//
//  Created by Kauna Mohammed on 03/06/2020.
//  Copyright © 2020 Kauna Mohammed. All rights reserved.
//

import UIKit
import Coordinator

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let _ = (scene as? UIWindowScene) else { return }
    }

}

