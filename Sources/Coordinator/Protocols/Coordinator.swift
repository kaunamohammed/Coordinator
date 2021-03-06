//
//  Coordinator.swift
//  Coordinator
//
//  Created by Kauna Mohammed on 15/03/2019.
//


public typealias TabFlowCoordinator = NavigationTransitionCoordinator & TabBarType

/**
 `Coordinatable` starts the flow of the app by abstracting away the handling of navigation from the `UIViewController` and delegating that responsibility to a type that conforms to it
 */
public protocol Coordinator: AnyObject {
    
    var key: String { get }
    
    /// starts the navigation from one view controller to the next
    func start()
    
}
