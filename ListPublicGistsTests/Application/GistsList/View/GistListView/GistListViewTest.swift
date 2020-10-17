//
//  GistListViewTest.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 17/10/20.
//

import XCTest

@testable import ListPublicGists

class GistListViewTest: XCTestCase {
    
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
    
    func test_() {
        let gistMock = initGistMock()
        sut.configure(state: .load([gistMock]))
        sut.tableView(sut.tableView, prefetchRowsAt: [IndexPath(row: 0, section: 0)])
        
        XCTAssertTrue(gistsListViewDelegateMock.gistListViewPrefetchGistsCalled)
    }
}

extension GistListViewTest {
    private func initGistMock() -> Gist {
        return Gist(owner: GistOwner(login: "Dummy",
                                     avatar_url: "http://"),
                    files: ["File" : GistFile(filename: "filename",
                                              type: "type")])
    }
}
