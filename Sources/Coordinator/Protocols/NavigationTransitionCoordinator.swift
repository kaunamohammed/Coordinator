//
//  NavigationBarCoordinatable.swift
//  Coordinator
//
//  Created by Kauna Mohammed on 15/03/2019.
//

import UIKit

public protocol NavigationTransitionCoordinator: Coordinator, RemoveAction {
    
    /// the presenter of the next viewcontroller
    var presenter: UINavigationController { get }
    
    /// navigates to a `UIViewController` with a particular presentation style
    func navigate(with presentationStyle: PresentationStyle, animated: Bool)
        
}

// MARK: - PresentationStyle
public extension NavigationTransitionCoordinator {

    func popViewController(animated: Bool) {
        presenter.popViewController(animated: animated)
    }
    
}

public enum PresentationStyle {
    case set, push, present, dismiss, pop
}
