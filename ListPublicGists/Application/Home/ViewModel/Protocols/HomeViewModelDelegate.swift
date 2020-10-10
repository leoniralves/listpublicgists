//
//  HomeViewModelDelegate.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func homeViewModelDidShowPublicGists(_ viewModel: HomeViewModel)
}
