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

    private lazy var appCoordinator: AppCoordinator = {
      let coordinator = CoordinatorExampleAppCoordinator(window: window!)
      return coordinator
    }()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = scene as? UIWindowScene  else { return }
        
        let window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        self.window = window
        self.window?.windowScene = windowScene
        appCoordinator.start()
        
    }

}

