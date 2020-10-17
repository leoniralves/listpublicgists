//
//  GistsListViewModelDelegate.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 17/10/20.
//

import Foundation

protocol GistsListViewModelDelegate: AnyObject {
    func gistsListViewModel(_ viewModel: GistsListViewModel, didSelectGist gist: Gist)
}
