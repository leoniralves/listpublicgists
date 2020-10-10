//
//  HomeCoordinatorTest.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import Foundation
import XCTest

@testable import ListPublicGists

class HomeCoordinatorTest: XCTestCase {
    
    func testStart_shouldShowHomeViewController() {
        let nav = NavigationControllerSpy()
        let homeCoordinator = HomeCoordinator(presenter: nav)
        homeCoordinator.start()
        XCTAssertTrue(nav.viewControllerCalled.isKind(of: HomeViewController.self))
    }
}
