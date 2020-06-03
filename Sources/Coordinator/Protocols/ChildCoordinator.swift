//
//  ChildCoordinator.swift
//  Pods-Coordinator_Example
//
//  Created by Kauna Mohammed on 15/03/2019.
//

/**
 `ChildCoordinatable` handles adding and removing child coordinatables from types conforming to it
 */
public protocol ChildCoordinator: class {
    
    /// The dictionary containing any child coordinatable
    var children: [String: Coordinator] { get set }

    /**
    
    Add a child coordinatable to the parent
    
    - parameter child: The child coordinator to add as a child
    - parameter key: An optional key to associate with the coordinator
     
    */
    func add(_ child: Coordinator)
    
    /**
     
     Removes a child coordinatable from the parent
     
     - parameter child: The child coordinator to remove from the parent
     
     */
    func remove(_ child: Coordinator)
    
    
    /// Removes all child coordinatables from the parent
    func removeAll()
        
}
