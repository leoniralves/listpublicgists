//
//  GistsListRepositoryProtocol.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 16/10/20.
//

import Foundation

protocol GistsListRepositoryProtocol {
    var service: ServiceProvider { get }
    
    func getGistsList(page: Int,
                      items: Int,
                      completion: @escaping (Result<[Gist], NetworkError>) -> Void)
}
