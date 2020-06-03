//
//  File.swift
//  
//
//  Created by Kauna Mohammed on 03/06/2020.
//

public protocol ChildTransitionCoordinator: Coordinator {
    associatedtype RouteType: Route
    
    func transition(to route: RouteType)
}
