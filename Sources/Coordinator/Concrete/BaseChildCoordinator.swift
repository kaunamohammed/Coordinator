//
//  ChildCoordinator.swift
//  Pods-Coordinator_Example
//
//  Created by Kauna Mohammed on 15/03/2019.
//
import UIKit

/// a convenience class to allow ommiting the `ChildCoordinatable` protocol requirement
/// while still having the benefit of `ChildCoordinatable`
open class BaseChildCoordinator<Controller: UIViewController, RouteType: Route>: BaseNavigationCoordinator<Controller, RouteType>, ChildTransitionCoordinator {
    
    public lazy var children: [String : Coordinator] = [:]
        
    open override func start() {
        fatalError("Subclass should implement")
    }
    
    open func transition(to route: RouteType) {
        
    }
        
}

// MARK: - ChildCoordinatable -
extension BaseChildCoordinator: ChildCoordinator {
    
    public func add(_ child: Coordinator) {
        print("ADD: \(child.key)")
        children.updateValue(child, forKey: child.key)
        print(children.values.count)
    }
        
    public func remove(_ child: Coordinator) {
        print("REMOVE: \(child.key)")
        children.removeValue(forKey: child.key)
        print(children.values.count)
    }
    
    public func removeAll() {
        children.removeAll()
    }
    
}

// MARK: - Convinience Methods -
extension BaseChildCoordinator {
    
    public func printChildrenCount() {
        print(children.count)
    }
    
}

private extension Int {
    
    var stringValue: String {
        return String(self)
    }
    
}
