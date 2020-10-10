//
//  NavigationControllerProtocol.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import UIKit

protocol NavigationControllerProtocol {
    func show(_ vc: UIViewController, sender: Any?)
}

extension UINavigationController: NavigationControllerProtocol {}
