//
//  API.swift
//  ProjectNoName
//
//  Created by Leonir Alves Deolindo on 05/10/20.
//

import Foundation

struct API: APIProtocol {
    var baseURL: String {
        #if MOCK
        return "http://127.0.0.1:4000"
        #else
        return "https://api.github.com"
        #endif
    }
}
