//
//  GistsListViewModelMock.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 17/10/20.
//

import Foundation

@testable import ListPublicGists

class GistsListViewModelMock: GistsListViewModelProtocol {
    var delegate: GistsListViewModelDelegate?
    var gistsStatus: Observable<RequestStates<[Gist]>> = Observable(.initializer)
    
    private(set) var getGistsListCalled = false
    private(set) var didSelectGistCalled = false
    
    func getGistsList() {
        getGistsListCalled = true
    }
    
    func didSelectGist(_ gist: Gist) {
        didSelectGistCalled = true
    }
}
