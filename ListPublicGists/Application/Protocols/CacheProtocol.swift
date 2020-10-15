//
//  CacheProtocol.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 14/10/20.
//

import Foundation

protocol CacheProtocol {
    
    associatedtype Key
    associatedtype Object
    
    func set(key: Key, image: Object)
    func get(key: Key) -> Object?
}
