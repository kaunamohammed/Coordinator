//
//  ViewControllerC.swift
//  CoordinatorLibrary_Example
//
//  Created by Kauna Mohammed on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Coordinator

class ViewControllerCCoordinator: BaseNavigationCoordinator<ViewControllerC> {
    
    override func start() {
        rootViewController = .init(removeAction: self)
        navigate(with: .push, animated: true)
    }

}

class ViewControllerC: CoordinatorViewController {
    
    private lazy var button: UIButton = {
        let b = UIButton()
        b.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        b.setTitle("Pop To Root", for: .normal)
        b.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        b.addTarget(self, action: #selector(tap), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    @objc private func tap() {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
