//
//  AppCoordinator.swift
//  Coordinator
//
//  Created by Kauna Mohammed on 11/09/2018.
//  Copyright © 2018 Kauna Mohammed. All rights reserved.
//

import Coordinator

// ideally this would be <Your App Name>AppCoordinator
// e.g. SnapchatAppCoordinator

class CoordinatorExampleAppCoordinator: AppCoordinator {
    
    var child: ViewControllerACoordinator!
    
    override func start() {
        child = .init(presenter: presenter)
        child.start()
    }
    
}
