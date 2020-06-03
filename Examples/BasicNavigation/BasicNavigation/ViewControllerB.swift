//
//  ViewControllerB.swift
//  Coordinator_Example
//
//  Created by Kauna Mohammed on 15/03/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Coordinator

class ViewControllerBCoordinator: BaseChildCoordinator<ViewControllerB> {
    
    enum AvailableRoutes: Route {
        case coordinatorC
    }
    
    enum ChildKeys: String {
        case coordinatorC
    }
    
    var child: ViewControllerCCoordinator?
    
    override func start() {
        rootViewController = .init(removeAction: self)
        navigate(with: .push, animated: true)
        rootViewController.didTapButton = { [weak self] in
            self?.startChild()
        }
        
    }
    
    func coordinate(to route: AvailableRoutes) {
        switch route {
        case .coordinatorC:
            child = .init(presenter: presenter)
            add(coordinator: child!, key: ChildKeys.coordinatorC.rawValue)
            child?.start()
            child?.movingFromParent = { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.remove(coordinator: strongSelf.child!)
            }
        }
    }
    
    private func startChild() {
        child = .init(presenter: presenter)
        add(coordinator: child!, key: ChildKeys.coordinatorC.rawValue)
        child!.start()
    }
    
    deinit {
        print("Bye: \(self)")
    }
    
}

class ViewControllerB: CoordinatorViewController {
    
    private lazy var button: UIButton = {
        let b = UIButton()
        b.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        b.setTitle("Next VC", for: .normal)
        b.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        b.addTarget(self, action: #selector(tap), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    public var didTapButton: (() -> Void)?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    @objc private func tap() {
        didTapButton?()
    }
    
}
