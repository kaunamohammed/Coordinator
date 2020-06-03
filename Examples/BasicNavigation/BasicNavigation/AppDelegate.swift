//
//  AppDelegate.swift
//  BasicNavigation
//
//  Created by Kauna Mohammed on 03/06/2020.
//  Copyright © 2020 Kauna Mohammed. All rights reserved.
//

import UIKit
import Coordinator

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private lazy var appCoordinator: AppCoordinator = {
      let coordinator = CoordinatorExampleAppCoordinator(window: window!)
      return coordinator
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if #available(iOS 13, *) {
            // do nothing
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
            appCoordinator.start()
        }
        
        return true
    }

}

