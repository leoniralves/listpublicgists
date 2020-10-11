//
//  API.swift
//  ProjectNoName
//
//  Created by Leonir Alves Deolindo on 05/10/20.
//

import Foundation

struct API {
    static var baseURL: String {
        #if DEBUG
        return "http://127.0.0.1:4000"
        #endif
    }
}
