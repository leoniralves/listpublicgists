//
//  GistsListViewDelegate.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 17/10/20.
//

import Foundation

protocol GistsListViewDelegate: AnyObject {
    func gistListRetry(_ gistListView: GistsListView)
    func gistListViewPrefetchGists(_ gistListView: GistsListView)
}
