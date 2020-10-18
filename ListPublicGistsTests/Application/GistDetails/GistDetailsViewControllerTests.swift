//
//  GistDetailsViewControllerTests.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 18/10/20.
//

import XCTest

@testable import ListPublicGists

class GistDetailsViewControllerTests: XCTestCase {
    
    func test_viewDidLoad_titleShouldEqualGistsListStrings() {
        let viewModelMock = GistDetailsViewModelMock(gist: initGistMock())
        let sut = GistDetailsViewController(viewModel: viewModelMock)
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.title, viewModelMock.gist.owner.login)
    }
}
