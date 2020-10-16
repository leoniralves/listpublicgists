//
//  GistsListRepository.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import Foundation

protocol GistsListRepositoryProtocol {
    func getGistsList(page: Int,
                      items: Int,
                      completion: @escaping (Result<[Gist], NetworkError>) -> Void)
}

struct GistsListRepository: GistsListRepositoryProtocol {
    private let service: ServiceProvider
    
    init(service: ServiceProvider = ServiceProvider()) {
        self.service = service
    }
}

extension GistsListRepository {
    func getGistsList(page: Int,
                      items: Int,
                      completion: @escaping (Result<[Gist], NetworkError>) -> Void) {
        service.request(target: ListGistsServiceTarget.gists(page: page,
                                                             items: items),
                        completion: completion)
    }
}
