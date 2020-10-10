//
//  HomeViewDelegateMock.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import Foundation

@testable import ListPublicGists

class HomeViewDelegateMock: HomeViewDelegate {
    private(set) var didShowPublicGistisListCalled = false
    func homeViewDidShowPublicGistisList(_ view: HomeView) {
        didShowPublicGistisListCalled = true
    }
}
