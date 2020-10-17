//
//  HomeCoordinatorTest.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import XCTest

@testable import ListPublicGists

class HomeCoordinatorTest: XCTestCase {
    
    private var navigationControllerSpy: NavigationControllerSpy!
    private var sut: HomeCoordinator!
    
    override func setUp() {
        super.setUp()
        navigationControllerSpy = NavigationControllerSpy()
        sut = HomeCoordinator(presenter: navigationControllerSpy)
    }
    
    override func tearDown() {
        super.tearDown()
        navigationControllerSpy = nil
        sut = nil
    }
    
    func test_start_shouldShowHomeViewController() {
        sut.start()
        XCTAssertTrue(navigationControllerSpy.viewControllerCalled.isKind(of: HomeViewController.self))
    }
    
    func test_showGistsList() {
        let viewModel = HomeViewModel()
        sut.homeViewModelDidShowPublicGists(viewModel)
        
        XCTAssertTrue(navigationControllerSpy.viewControllerCalled.isKind(of: GistsListViewController.self))
    }
}
