//
//  RequestStates.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 13/10/20.
//

import Foundation

enum RequestStates<T> {
    case initializer
    case loading
    case load(T)
    case error(NetworkError)
}
