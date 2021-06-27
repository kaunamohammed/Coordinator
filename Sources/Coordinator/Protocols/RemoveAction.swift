//
//  RemoveAction.swift
//  CoordinatorLibrary
//
//  Created by Kauna Mohammed on 06/08/2019.
//

import Foundation

public typealias CoordinatorAction = (() -> Void)

public protocol RemoveAction: AnyObject {
    
    /// A closure called when a child coordinator is removed from a parent coordinator.
    var movingFromParent: CoordinatorAction? { get }
    
}
