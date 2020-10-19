//
//  RouterType.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 19/10/20.
//

import UIKit

protocol RouterType {
    func show(_ viewController: UIViewController, completion: (() -> Void)?)
}

class Router: NSObject, RouterType {
    
    private var navigationController: NavigationControllerProtocol
    private var completions: [UIViewController : (()->Void)] = [:]
    
    init(navigationController: NavigationControllerProtocol) {
        self.navigationController = navigationController
        super.init()
        self.navigationController.delegate = self
    }
    
    func show(_ viewController: UIViewController, completion: (() -> Void)?) {
        completions[viewController] = completion
        navigationController.show(viewController, sender: nil)
    }
    
    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
}

extension Router: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let poppedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
              !navigationController.viewControllers.contains(poppedViewController) else {
            return
        }
     
        runCompletion(for: poppedViewController)
    }
}
