//
//  GistsListViewModelProtocol.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 16/10/20.
//

import Foundation

protocol GistsListViewModelProtocol {
    // MARK: Properties
    var gistsStatus: Observable<RequestStates<[Gist]>> { get }
    var delegate: GistsListViewModelDelegate? { get set }
    
    // MARK: Methods
    func getGistsList()
    func didSelectGist(_ gist: Gist)
}
