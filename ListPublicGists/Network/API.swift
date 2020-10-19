//
//  API.swift
//  ProjectNoName
//
//  Created by Leonir Alves Deolindo on 05/10/20.
//

import Foundation

struct API: APIProtocol {
    var baseURL: String {
        #if DEBUG
        return "https://api.github.com"
        #elseif MOCK
//        return "http://127.0.0.1:4000"
        return "http://192.168.2.110:4000"
        #else
        return "URL_RELEASE"
        #endif
    }
}
