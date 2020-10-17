//
//  GistsListViewDelegateMock.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 17/10/20.
//

import Foundation

@testable import ListPublicGists

class GistsListViewDelegateMock: GistsListViewDelegate {
    private(set) var gistListRetryCalled = false
    private(set) var gistListViewPrefetchGistsCalled = false
    
    func gistListRetry(_ gistListView: GistsListView) {
        gistListRetryCalled = true
    }
    
    func gistListViewPrefetchGists(_ gistListView: GistsListView) {
        gistListViewPrefetchGistsCalled = true
    }
}
