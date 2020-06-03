//
//  ChildCoordinator.swift
//  Pods-Coordinator_Example
//
//  Created by Kauna Mohammed on 15/03/2019.
//
import UIKit

/// a convenience class to allow ommiting the `ChildCoordinatable` protocol requirement
/// while still having the benefit of `ChildCoordinatable`
open class BaseChildCoordinator<T: UIViewController>: BaseNavigationCoordinator<T>  {
    
    public lazy var children: [String : Coordinator] = [:]
        
    open override func start() {
        fatalError("Subclass should implement")
    }
    
}

// MARK: - ChildCoordinatable -
extension BaseChildCoordinator: ChildCoordinator {
    
    public func add(coordinator: Coordinator) {
        add(coordinator: coordinator, key: children.count.stringValue)
    }
        
    public func add(coordinator: Coordinator, key: String) {
        children.updateValue(coordinator, forKey: key)
    }
        
    public func remove(coordinator: Coordinator) {
        children = children.filter { $0.value !== coordinator }
    }
    
    public func remove(childKey: String) {
        children.removeValue(forKey: childKey)
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
