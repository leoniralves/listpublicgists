//
//  NavigationControllerSpy.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import UIKit
@testable import ListPublicGists

class NavigationControllerSpy: NavigationControllerProtocol {
    
    private(set) var viewControllerCalled = UIViewController()
    
    func show(_ vc: UIViewController, sender: Any?) {
        viewControllerCalled = vc
    }
}
