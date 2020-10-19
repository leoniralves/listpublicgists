//
//  HomeCoordinatorTests.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import XCTest

@testable import ListPublicGists

class HomeCoordinatorTests: XCTestCase {
    
    private var navigationControllerSpy: NavigationControllerSpy!
    private var sut: HomeCoordinator!
    
    override func setUp() {
        super.setUp()
        navigationControllerSpy = NavigationControllerSpy()
        
        let router = Router(navigationController: navigationControllerSpy)
        
        sut = HomeCoordinator(router: router)
    }
    
    override func tearDown() {
        super.tearDown()
        navigationControllerSpy = nil
        sut = nil
    }
    
    func test_start_shouldShowHomeViewController() {
        sut.start(completion: nil)
        
        XCTAssertTrue(navigationControllerSpy.viewControllerCalled.isKind(of: HomeViewController.self))
    }
    
    func test_showGistsList() {
        let viewModelMock = HomeViewModelMock()
        sut.homeViewModelDidShowPublicGists(viewModelMock)
        
        XCTAssertTrue(navigationControllerSpy.viewControllerCalled.isKind(of: GistsListViewController.self))
    }
}
