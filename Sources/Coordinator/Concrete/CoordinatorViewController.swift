//
//  CoordinatorViewController.swift
//  CoordinatorLibrary
//
//  Created by Kauna Mohammed on 04/08/2019.
//

import UIKit

/**

`CoordinatorViewController` is a convenience class that forwards a message that the current view controller is about going to removed from the view controller hierachy

*/
open class CoordinatorViewController: UIViewController {
    
    /// The coordinator to be removed from the coordinator hierachy
    public weak var removeAction: RemoveAction?
    
    public init(removeAction: RemoveAction?) {
        self.removeAction = removeAction
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isMovingFromParent {
            removeAction?.movingFromParent?()
        }
    }

}
