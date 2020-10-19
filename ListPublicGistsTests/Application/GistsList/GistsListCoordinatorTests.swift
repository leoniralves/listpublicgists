//
//  GistsListCoordinatorTests.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 17/10/20.
//

import XCTest

@testable import ListPublicGists

class GistsListCoordinatorTests: XCTestCase {
    
    private var navigationControllerSpy: NavigationControllerSpy!
    private var sut: GistsListCoordinator!
    
    override func setUp() {
        super.setUp()
        navigationControllerSpy = NavigationControllerSpy()
        
        let router = Router(navigationController: navigationControllerSpy)
        
        sut = GistsListCoordinator(router: router)
    }
    
    override func tearDown() {
        super.tearDown()
        navigationControllerSpy = nil
        sut = nil
    }
    
    func test_start_shouldShowHomeViewController() {
        sut.start(completion: nil)
        
        XCTAssertTrue(navigationControllerSpy.viewControllerCalled.isKind(of: GistsListViewController.self))
    }
    
    func test_showGistDetails() {
        let viewModelMock = GistsListViewModelMock()
        sut.gistsListViewModel(viewModelMock, didSelectGist: initGistMock())
        
        XCTAssertTrue(navigationControllerSpy.viewControllerCalled.isKind(of: GistDetailsViewController.self))
    }
}
