//
//  Gist.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import Foundation

struct Gist: Decodable, Equatable {
    let owner: GistOwner
    let files: [String: GistFile]
    let isPublic: Bool
    let createdAt: Date
    let updatedAt: Date
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case owner
        case files
        case isPublic = "public"
        case createdAt
        case updatedAt
        case description
    }
    
    subscript(file index: Int) -> (key: String, value: GistFile) {
        files.sorted{ $0.key > $1.key }[index]
    }
}
