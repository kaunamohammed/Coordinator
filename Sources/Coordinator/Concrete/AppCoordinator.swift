//
//  AppCoordinator.swift
//  CoordinatorLibrary
//
//  Created by Kauna Mohammed on 15/03/2019.
//

import UIKit

/// A base class that acts as the starting coordinator
/// This class should kick off coordination from the 'AppDelegate'
open class AppCoordinator: Coordinator { 
    
    public let window: UIWindow
    public let presenter: UINavigationController
        
    public init(presenter: UINavigationController = .init(), window: UIWindow) {
        self.window = window
        self.presenter = presenter
        window.rootViewController = presenter
        window.makeKeyAndVisible()
    }
    
    open func start() {
        fatalError("Subclass must implement")
    }
    
}
