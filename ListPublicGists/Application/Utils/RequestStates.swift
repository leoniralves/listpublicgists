//
//  RequestStates.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 13/10/20.
//

import Foundation

enum RequestStates<T>: Equatable where T: Equatable {
    case initializer
    case loading
    case load(T)
    case error(NetworkError)
    case empty
}
