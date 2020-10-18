//
//  GistDetailsViewModel.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 17/10/20.
//

import Foundation

class GistDetailsViewModel: GistDetailsViewModelProtocol {

    let gist: Gist
    
    init(gist: Gist) {
        self.gist = gist
    }
}
