//
//  NavigationCoordinator.swift
//  Coordinator
//
//  Created by Kauna Mohammed on 15/03/2019.
//

import UIKit

/**
 
 `BaseNavigationCoordinator` is a base class for subclasses wanting to provide a navigation flow
 
 */
open class BaseNavigationCoordinator<Controller: UIViewController, RouteType: Route>: NSObject, NavigationTransitionCoordinator {
        
    public var key: String {
        return String(describing: type(of: self))
    }
        
    public let presenter: UINavigationController
    
    /// The `UIViewController` associated with the class
    public var rootViewController: Controller!
    
    public var movingFromParent: (() -> Void)?
    
    public init(presenter: UINavigationController = .init()) {
        self.presenter = presenter
    }
    
    // MARK: - NavigationFlowCoordinator
    open func start() {
        fatalError("Subclass must provide implementation")
    }
    
    public func navigate(with presentationStyle: PresentationStyle, animated: Bool) {
        switch presentationStyle {
        case .present:
            presenter.present(rootViewController, animated: animated, completion: nil)
        case .push:
            presenter.pushViewController(rootViewController, animated: animated)
        case .set:
            presenter.setViewControllers([rootViewController], animated: animated)
        case .dismiss:
            presenter.dismiss(animated: animated, completion: movingFromParent)
        case .pop:
            presenter.popViewController(animated: animated)
        }
    }
 
}
