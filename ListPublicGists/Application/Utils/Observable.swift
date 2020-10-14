//
//  Observable.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 13/10/20.
//

import Foundation

class Observable<T> {
    var value: T {
        didSet {
            self.didChange?(self.value)
        }
    }
    
    var didChange: ((T) -> Void)?
    
    init(_ value: T) {
        self.value = value
    }
}
