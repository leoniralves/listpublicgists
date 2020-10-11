//
//  URLSessionDataTaskProtocol.swift
//  SearchGitUsersMVC
//
//  Created by Leonir Alves Deolindo on 07/03/20.
//  Copyright © 2020 Leonir Deolindo. All rights reserved.
//

import Foundation

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}
