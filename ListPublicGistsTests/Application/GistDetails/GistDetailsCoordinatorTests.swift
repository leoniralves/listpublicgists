//
//  GistDetailsCoordinatorTests.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 18/10/20.
//

import XCTest

@testable import ListPublicGists

class GistDetailsCoordinatorTests: XCTestCase {
    
    private var navigationControllerSpy: NavigationControllerSpy!
    private var sut: GistDetailsCoordinator!
    
    override func setUp() {
        super.setUp()
        navigationControllerSpy = NavigationControllerSpy()
        sut = GistDetailsCoordinator(presenter: navigationControllerSpy,
                                     gist: initGistMock())
    }
    
    override func tearDown() {
        super.tearDown()
        navigationControllerSpy = nil
        sut = nil
    }
    
    func test_start_shouldShowHomeViewController() {
        sut.start()
        
        XCTAssertTrue(navigationControllerSpy.viewControllerCalled.isKind(of: GistDetailsViewController.self))
    }
}
