//
//  ServiceTargetProtocol.swift
//  SearchGitUsersMVC
//
//  Created by Leonir Alves Deolindo on 07/03/20.
//  Copyright © 2020 Leonir Deolindo. All rights reserved.
//

import Foundation

protocol ServiceTargetProtocol {
    var path: String { get }
    var method: HTTPMethod { get }
    var header: [String: String]? { get }
    var parameters: [String: String]? { get }
}
