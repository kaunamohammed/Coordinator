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
    
    - parameter coordinator: The coordinator to add as a child
    - parameter key: The key associated with the coordinator
     
    */
    func add(coordinator: Coordinator, key: String)
    
    /**
     
     Add a child coordinatable to the parent
     
     This method automatically assigns a key to its child coordinator and is preferred when using a `TabFlowCoordinator` as the order in which you add a child would determine the order inwhich the tab bars are shown
     
     - parameter coordinator: The coordinator to add as a child
     
     */
    func add(coordinator: Coordinator)
    
    /**
     
     
     Removes a child coordinatable from the parent
     
     - parameter childCoordinator: The coordinator to remove from the parent
     
     */
    func remove(coordinator: Coordinator)
    
    /**
     
     Removes a child coordinatable from the parent using its key
     
     - parameter childKey: the key of the coordinator to be removed
     
     */
    func remove(childKey: String)
    
    /// Removes all child coordinatables from the parent
    func removeAll()
        
}
