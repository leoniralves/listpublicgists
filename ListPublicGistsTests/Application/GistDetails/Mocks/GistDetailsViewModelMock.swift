//
//  GistDetailsViewModelMock.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 18/10/20.
//

import Foundation

@testable import ListPublicGists

class GistDetailsViewModelMock: GistDetailsViewModelProtocol {
    private(set) var gist: Gist
    
    init(gist: Gist) {
        self.gist = gist
    }
}
