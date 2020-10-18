//
//  GistFile.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 16/10/20.
//

import Foundation

struct GistFile: Decodable, Equatable {
    let filename: String
    let type: String
    let language: String?
    let rawUrl: String
}
