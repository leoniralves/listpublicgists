//
//  Cacheable.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 14/10/20.
//

import Foundation

protocol Cacheable {
    
    associatedtype Key
    associatedtype Object
    
    func set(key: Key, object: Object)
    func get(key: Key) -> Object?
}
