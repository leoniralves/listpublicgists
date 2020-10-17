//
//  HomeViewModelMock.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 17/10/20.
//

import Foundation

@testable import ListPublicGists

class HomeViewModelMock: HomeViewModelProtocol {
    var delegate: HomeViewModelDelegate?
    
    private(set) var showPublicGistsCalled = false
    func showPublicGists() {
        showPublicGistsCalled = true
    }
}
