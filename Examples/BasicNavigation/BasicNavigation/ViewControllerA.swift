//
//  ViewControllerA.swift
//  Coordinator
//
//  Created by kaunamohammed on 03/15/2019.
//  Copyright (c) 2019 kaunamohammed. All rights reserved.
//

import UIKit
import Coordinator

enum VCAAvailableRoutes: Route {
    case coordinatorB
}

class ViewControllerACoordinator: BaseChildCoordinator<ViewControllerA, VCAAvailableRoutes> {
    
    var child: ViewControllerBCoordinator!
    
    override func start() {
        rootViewController = .init(removeAction: self)
        navigate(with: .push, animated: true)
        rootViewController.didTapButton = { [weak self] in
            self?.transition(to: .coordinatorB)
        }
    }
    
    override func transition(to route: VCAAvailableRoutes) {
        switch route {
        case .coordinatorB:
            child = ViewControllerBCoordinator(presenter: presenter)
            add(child)
            child.start()
            child.movingFromParent = { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.remove(strongSelf.child)
            }
        }
    }
    
}

class ViewControllerA: CoordinatorViewController {
    
    private lazy var button: UIButton = {
        let b = UIButton()
        b.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        b.setTitle("Next VC", for: .normal)
        b.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        b.addTarget(self, action: #selector(tap), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    var didTapButton: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
    }
    
    @objc private func tap() {
        didTapButton?()
    }

}

