//
//  GistsListViewControllerTest.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 17/10/20.
//

import XCTest

@testable import ListPublicGists

class GistsListViewControllerTest: XCTestCase {
    
    private var viewModelMock: GistsListViewModelMock!
    private var sut: GistsListViewController!
    
    override func setUp() {
        super.setUp()
        viewModelMock = GistsListViewModelMock()
        sut = GistsListViewController(viewModel: viewModelMock)
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        super.tearDown()
        viewModelMock = nil
        sut = nil
    }
    
    func test_loadView_ViewShouldTypeGistListView() {
        XCTAssertTrue(sut.view.isKind(of: GistsListView.self))
    }
    
    func test_viewDidLoad_titleShouldEqualGistsListStrings() {
        XCTAssertEqual(sut.title, GistsListStrings.Controller.title)
    }
    
    func test_gistListRetry_shouldCallGetGistsListOnViewModel() {
        sut.gistsListView.delegate?.gistListRetry(GistsListView())
        
        XCTAssertTrue(viewModelMock.getGistsListCalled)
    }
    
    func test_gistListViewPrefetchGists_shouldCallGetGistsListOnViewModel() {
        sut.gistsListView.delegate?.gistListViewPrefetchGists(GistsListView())
        
        XCTAssertTrue(viewModelMock.getGistsListCalled)
    }
    
    func test_didSelectGistsOnTableView_shouldCallDidSelectGistOnViewModel() {
        sut.gistsListView.delegate?.gistListView(GistsListView(),
                                                 didSelectGist: initGistMock())
        
        XCTAssertTrue(viewModelMock.didSelectGistCalled)
    }
}
