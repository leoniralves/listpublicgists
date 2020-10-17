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
    
    // MARK: Methods
    func getGistsList()
}
