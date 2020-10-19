//
//  NavigationController+Utils.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 14/10/20.
//

import UIKit

// MARK: Protocols

protocol NavigationControllerProtocol {
    var delegate: UINavigationControllerDelegate? { get set }
    
    func show(_ vc: UIViewController, sender: Any?)
}

// MARK: Extensions

extension UINavigationController: NavigationControllerProtocol {}
