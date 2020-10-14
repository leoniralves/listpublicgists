//
//  Gist.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import Foundation

struct Gist: Decodable {
    let owner: GistOwner
    let files: [String: GistFile]
    
    subscript(file index: Int) -> (key: String, value: GistFile) {
        files.sorted{ $0.key > $1.key }[index]
    }
}

struct GistOwner: Decodable {
    let login: String
    let avatar_url: String
}

struct GistFile: Decodable {
    let filename: String
}
