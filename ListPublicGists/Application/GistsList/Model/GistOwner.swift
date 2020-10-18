//
//  GistOwner.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 16/10/20.
//

import Foundation

struct GistOwner: Decodable, Equatable {
    let login: String
    let avatarUrl: String
}
