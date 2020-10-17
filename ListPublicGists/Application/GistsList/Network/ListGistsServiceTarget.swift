//
//  ListGistsServiceTarget.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import Foundation

enum ListGistsServiceTarget: ServiceTargetProtocol {
    case gists(page: Int, items: Int)
}

extension ListGistsServiceTarget {
    var path: String {
        "/gists/public"
    }
    
    var method: HTTPMethod {
        .GET
    }
    
    var header: [String : String]? {
        ["Accept": "application/vnd.github.v3+json"]
    }
    
    var parameters: [String : String]? {
        var parameters: [String : String] = [:]
        switch self {
        case let .gists(page, items):
            parameters["page"] = page.toString()
            parameters["per_page"] = items.toString()
        }
        
        return parameters
    }
}

extension Int {
    func toString() -> String {
        String(describing: self)
    }
}
