//
//  HomeViewModelTests.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import XCTest

@testable import ListPublicGists

class HomeViewModelTests: XCTestCase {
    
    func test_showPublicGists() {
        let sut = HomeViewModel()
        let delegateMock = HomeViewModelDelegateMock()
        sut.delegate = delegateMock
        
        sut.showPublicGists()
        
        XCTAssertTrue(delegateMock.didShowPublicGistsCalled)
    }
}
