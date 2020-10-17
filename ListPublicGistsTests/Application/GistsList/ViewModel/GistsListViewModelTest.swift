//
//  GistsListViewTests.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 16/10/20.
//

import XCTest
import UIKit

@testable import ListPublicGists

class GistsListViewModelTest: XCTestCase {
    
    private var expectation: XCTestExpectation!
    
    override func setUp() {
        super.setUp()
        expectation = XCTestExpectation(description: "Expected return of service on Gist List View Model")
    }
    
    override func tearDown() {
        super.tearDown()
        expectation = nil
    }
    
    func test_initializationViewModel_statusShouldBeInitializer() {
        let sessionMock = URLSessionMock(stub: (file: "",
                                                statusCode: 200),
                                         urlError: nil)
        let service = ServiceProvider(session: sessionMock)
        let gistsListRepositoryMock = GistsListRepository(service: service)
        let sut = GistsListViewModel(repository: gistsListRepositoryMock)
        
        XCTAssertEqual(sut.gistsStatus.value, .initializer)
    }
    
    func test_getGistsList_afterResult_withStatusCode200AndValidList_statusShouldBeLoadWithData() {
        let sessionMock = URLSessionMock(stub: (file: "gists_list_with_item_return_success",
                                                statusCode: 200),
                                         urlError: nil)
        let service = ServiceProvider(session: sessionMock)
        let gistsListRepositoryMock = GistsListRepository(service: service)
        let sut = GistsListViewModel(repository: gistsListRepositoryMock)
        
        sut.gistsStatus.didChange = { state in
            self.expectation.fulfill()
            switch state {
            case .initializer:
                XCTFail("Initializer - Wrong state")
            case .loading:
                XCTAssertEqual(sut.gistsStatus.value, .loading)
            case .load(let gists):
                XCTAssertEqual(gists[0].owner.login, "Dummy User")
                XCTAssertEqual(gists[0].owner.avatar_url, "https://dummy.com")
                XCTAssertEqual(gists[0].files.first!.key, "Dummy.ext")
                XCTAssertEqual(gists[0].files.first!.value.filename, "Dummy File")
                XCTAssertEqual(gists[0].files.first!.value.type, "application/dummy")
                XCTAssertEqual(gists[0].files.first!.value.language, "Dummy")
            case .empty:
                XCTFail("Empty - Wrong state")
            case .error(let error):
                XCTFail("Failed Gists list request. Error: \(error)")
            }
        }
        
        sut.getGistsList()
    }
    
    func test_getGistsList_afterResult_withStatusCode200AndEmptyList_statusShouldBeEmpty() {
        let sessionMock = URLSessionMock(stub: (file: "empty_gists_list_return_success",
                                                statusCode: 200),
                                         urlError: nil)
        let service = ServiceProvider(session: sessionMock)
        let gistsListRepositoryMock = GistsListRepository(service: service)
        let sut = GistsListViewModel(repository: gistsListRepositoryMock)
        
        sut.gistsStatus.didChange = { state in
            self.expectation.fulfill()
            switch state {
            case .initializer:
                XCTFail("Initializer - Wrong state")
            case .loading:
                XCTAssertEqual(sut.gistsStatus.value, .loading)
            case .load:
                XCTFail("Load - Wrong state")
            case .empty:
                XCTAssertEqual(sut.gistsStatus.value, .empty)
            case .error(let error):
                XCTFail("Failed Gists list request. Error: \(error)")
            }
        }
        
        sut.getGistsList()
    }
    
    func test_getGistsList_afterResult_withError_statusShouldBeError() {
        let sessionMock = URLSessionMock(stub: (file: nil,
                                                statusCode: 403),
                                         urlError: nil)
        let service = ServiceProvider(session: sessionMock)
        let gistsListRepositoryMock = GistsListRepository(service: service)
        let sut = GistsListViewModel(repository: gistsListRepositoryMock)
        
        sut.gistsStatus.didChange = { state in
            self.expectation.fulfill()
            switch state {
            case .initializer:
                XCTFail("Initializer - Wrong state")
            case .loading:
                XCTAssertEqual(sut.gistsStatus.value, .loading)
            case .load:
                XCTFail("Load - Wrong state")
            case .empty:
                XCTFail("Empty - Wrong state")
            case .error(let error):
                XCTAssertEqual(sut.gistsStatus.value, .error(error))
            }
        }
        
        sut.getGistsList()
    }
}
