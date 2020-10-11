//
//  ListGistsServiceTarget.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import Foundation

enum ListGistsServiceTarget: ServiceTargetProtocol {
    case gists
}

extension ListGistsServiceTarget {
    var path: String {
        "/gists/public"
    }
    
    var method: HTTPMethod {
        .GET
    }
    
    var header: [String : String]? {
        nil
    }
    
    var parameters: [String : String]? {
        nil
    }
}
