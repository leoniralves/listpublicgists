//
//  Gist.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import Foundation

struct Gist: Decodable {
    let owner: GistOwner
    let files: [String: GistFiles]
}

struct GistOwner: Decodable {
    let login: String
    let avatar_url: String
}

struct GistFiles: Decodable {
    let filename: String
}
