//
//  HomeViewModelDelegateMock.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import Foundation

@testable import ListPublicGists

class HomeViewModelDelegateMock: HomeViewModelDelegate {
    private(set) var didShowPublicGistsCalled = false
    
    func homeViewModelDidShowPublicGists(_ viewModel: HomeViewModel) {
        didShowPublicGistsCalled = true
    }
}
