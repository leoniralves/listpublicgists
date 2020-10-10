//
//  HomeViewControllerTests.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import XCTest

@testable import ListPublicGists

class HomeViewControllerTests: XCTestCase {

    func test_initialize_whenTappingShowPublicGistListButtonIntoHomeView_shouldCalledShowPublicGists() {
        let vm = HomeViewModelMock()
        let sut = HomeViewController(viewModel: vm)
        sut.loadViewIfNeeded()
        tap(sut.homeView.showPublicGistListButton)
        XCTAssertTrue(vm.showPublicGistsCalled)
    }
}

class HomeViewModelMock: HomeViewModelProtocol {
    var delegate: HomeViewModelDelegate?
    
    private(set) var showPublicGistsCalled = false
    func showPublicGists() {
        showPublicGistsCalled = true
    }
}
