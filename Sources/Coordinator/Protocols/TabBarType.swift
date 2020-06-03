//
//  TabBarCoordinatable.swift
//  Coordinator
//
//  Created by Kauna Mohammed on 15/03/2019.
//

import UIKit

/**
 
 `TabBarType` allows access to a tab bar item
 
 */
public protocol TabBarType: class {
    /// The tab bar item to apply to the root controller
    var tabBarItem: UITabBarItem { get }
}

public extension Dictionary where Key == String, Value == Coordinator {
    
    var viewControllers: [UIViewController] {
        precondition(!values.isEmpty, "Please add children")
        precondition(allSatisfy( { $0.value is TabFlowCoordinator } ), "All coordinators must be of type TabFlowCoordinator")
        
        return sorted(by: { $0.key < $1.key })
        .map { $0.value as? TabFlowCoordinator }
        .compactMap { $0?.presenter }
    }
        
}


