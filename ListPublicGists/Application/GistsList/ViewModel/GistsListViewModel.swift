//
//  GistsListViewModel.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import Foundation

class GistsListViewModel: GistsListViewModelProtocol {
    
    // MARK: Private Properties
    private let repository: GistsListRepositoryProtocol
    private(set) var gistsStatus: Observable<RequestStates<[Gist]>> = Observable(.initializer)
    private var currentPage = 0
    private var numberOfItems = 30
    
    // MARK: Initializer
    init(repository: GistsListRepositoryProtocol = GistsListRepository()) {
        self.repository = repository
    }
    
    // MARK: Public Methods
    func getGistsList() {
        currentPage += 1
        gistsStatus.value = .loading
        repository.getGistsList(page: currentPage,
                                items: numberOfItems) { (result) in
            switch result {
            case .success(let gists):
                self.gistsStatus.value = gists.count > 0 ? .load(gists) : .empty
            case .failure(let error):
                self.gistsStatus.value = .error(error)
            }
        }
    }
}
