//
//  GistListViewTests.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 17/10/20.
//

import XCTest

@testable import ListPublicGists

class GistListViewTests: XCTestCase {
    
    private(set) var gistsListViewDelegateMock: GistsListViewDelegateMock!
    private(set) var sut: GistsListView!
    
    override func setUp() {
        super.setUp()
        gistsListViewDelegateMock = GistsListViewDelegateMock()
        sut = GistsListView()
        sut.delegate = gistsListViewDelegateMock
    }
    
    override func tearDown() {
        super.tearDown()
        gistsListViewDelegateMock = nil
        sut = nil
    }
    
    func test_configure_withErrorStatus_shouldCallGistListRetryCalledOnDelegate() {
        sut.configure(state: .error(.unknown))
        
        guard let errorView = sut.tableView.backgroundView as? ErrorView else {
            XCTFail()
            return
        }
        
        errorView.action?()
        
        XCTAssertTrue(gistsListViewDelegateMock.gistListRetryCalled)
    }
    
    func test_prefechtingRows_shouldCallGistListViewPrefetchGists() {
        let gistMock = initGistMock()
        sut.configure(state: .load([gistMock]))
        sut.tableView(sut.tableView, prefetchRowsAt: [IndexPath(row: 0, section: 0)])
        
        XCTAssertTrue(gistsListViewDelegateMock.gistListViewPrefetchGistsCalled)
    }
    
    func test_didSelectRowAt_shouldCalledDidSelectGistOnViewModelAndReturnSelectedGist() {
        let gistMock = initGistMock()
        sut.configure(state: .load([gistMock]))
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(gistsListViewDelegateMock.gistListViewDidSelectGistCalled.called)
        
        XCTAssertEqual(gistsListViewDelegateMock.gistListViewDidSelectGistCalled.gist!.owner.login, "Dummy")
        XCTAssertEqual(gistsListViewDelegateMock.gistListViewDidSelectGistCalled.gist!.owner.avatarUrl, "http://")
        XCTAssertEqual(gistsListViewDelegateMock.gistListViewDidSelectGistCalled.gist![file: 0].key, "File")
        XCTAssertEqual(gistsListViewDelegateMock.gistListViewDidSelectGistCalled.gist![file: 0].value.filename, "filename")
        XCTAssertEqual(gistsListViewDelegateMock.gistListViewDidSelectGistCalled.gist![file: 0].value.type, "type")
        XCTAssertEqual(gistsListViewDelegateMock.gistListViewDidSelectGistCalled.gist![file: 0].value.language, "language")
        XCTAssertEqual(gistsListViewDelegateMock.gistListViewDidSelectGistCalled.gist![file: 0].value.rawUrl, "http://dummy.com")
        XCTAssertEqual(gistsListViewDelegateMock.gistListViewDidSelectGistCalled.gist!.createdAt.getFormattedDate(format: "dd/MM/yyyy"), "10/10/2020")
        XCTAssertEqual(gistsListViewDelegateMock.gistListViewDidSelectGistCalled.gist!.updatedAt.getFormattedDate(format: "dd/MM/yyyy"), "10/10/2020")
    }
}
