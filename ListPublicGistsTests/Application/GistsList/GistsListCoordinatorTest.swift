//
//  GistsListCoordinatorTest.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 17/10/20.
//

import XCTest

@testable import ListPublicGists

class GistsListCoordinatorTest: XCTestCase {
    
    func test_start_shouldGistsListViewController() {
        let navigationControllerSpy = NavigationControllerSpy()
        let sut = GistsListCoordinator(presenter: navigationControllerSpy)
        sut.start()
        XCTAssertTrue(navigationControllerSpy.viewControllerCalled.isKind(of: GistsListViewController.self))
    }
}
