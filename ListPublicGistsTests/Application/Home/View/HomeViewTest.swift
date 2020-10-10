//
//  HomeViewTest.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import XCTest

@testable import ListPublicGists

class HomeViewTest: XCTestCase {
    
    private var sut: HomeView!
    
    override func setUp() {
        super.setUp()
        sut = HomeView()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func test_initializerHomeView_shouldSetupLayoutWithCorrectTexts() {
        XCTAssertEqual(sut.titleLabel.text,
                       HomeStrings.View.title)
        XCTAssertEqual(sut.descriptionLabel.text,
                       HomeStrings.View.description)
        XCTAssertEqual(sut.showPublicGistListButton.titleLabel?.text,
                       HomeStrings.View.showPublicGistsButton)
    }
    
    func test_tappingShowPublicGistListButton_shouldCallDidShowPublicGistisListDelegate() {
        let homeViewDelegateMock = HomeViewDelegateMock()
        sut.delegate = homeViewDelegateMock
        
        tap(sut.showPublicGistListButton)
        XCTAssertTrue(homeViewDelegateMock.didShowPublicGistisListCalled)
    }
}
