//
//  HomeViewControllerTests.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import XCTest

@testable import ListPublicGists

class HomeViewControllerTests: XCTestCase {

    private var viewModelMock: HomeViewModelMock!
    private var sut: HomeViewController!
    
    override func setUp() {
        super.setUp()
        viewModelMock = HomeViewModelMock()
        sut = HomeViewController(viewModel: viewModelMock)
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        super.tearDown()
        viewModelMock = nil
        sut = nil
    }
    
    func test_loadView_ViewShouldTypeHomeView() {
        XCTAssertTrue(sut.view.isKind(of: HomeView.self))
    }
    
    func test_viewDidLoad_titleShouldEqualGistsListStrings() {
        XCTAssertEqual(sut.title, HomeStrings.Controller.title)
    }
    
    func test_homeViewDidShowPublicGistisList_shouldCallShowPublicGistsOnViewModel() {
        sut.homeView.delegate?.homeViewDidShowPublicGistisList(HomeView())
        
        XCTAssertTrue(viewModelMock.showPublicGistsCalled)
    }
}
