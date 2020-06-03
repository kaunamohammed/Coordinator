//
//  Coordinator.swift
//  Coordinator
//
//  Created by Kauna Mohammed on 15/03/2019.
//


public typealias TabFlowCoordinator = NavigationBarCoordinator & TabBarType
public typealias NavigationFlowCoordinator = Coordinator & NavigationBarCoordinator & RemoveAction

public protocol Route {}

/**
 `Coordinatable` starts the flow of the app by abstracting away the handling of navigation from the `UIViewController` and delegating that responsibility to a type that conforms to it
 */
public protocol Coordinator: class {
    
    /// starts the navigation from one view controller to the next
    func start()
    
    func coordinate(to route: Route)
        
}

extension Coordinator {
    
    public func coordinate(to route: Route) {}
    
}
