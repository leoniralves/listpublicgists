//
//  NavigationControllerSpy.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import UIKit
@testable import ListPublicGists

class NavigationControllerSpy: NSObject, NavigationControllerProtocol {
    
    private(set) var viewControllerCalled = UIViewController()
    
    var delegate: UINavigationControllerDelegate?
    
    func show(_ vc: UIViewController, sender: Any?) {
        viewControllerCalled = vc
    }
}
