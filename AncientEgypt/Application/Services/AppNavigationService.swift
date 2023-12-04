//
//  AppNavigationService.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 04.12.2023.
//

import UIKit

class AppNavigationService {
    
    private var window: UIWindow?
    
    func configureWindow(_ window: UIWindow) {
        self.window = window
    }
    
    func show(_ viewController: UIViewController) {
        guard let window = window else {
            fatalError("Window is not set. Call configureWindow(_: UIWindow) to set it.")
        }
        
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
    
    func makeViewPresentation(_ view: UIViewController, _ destinationView: UIViewController, _ animated: Bool = true, _ completion: (() -> Void)? = nil) {
        UIView.transition(with: view.view, duration: 4, options: .transitionCrossDissolve, animations: {
            view.present(destinationView, animated: true)
        }, completion: nil)
    }
}

