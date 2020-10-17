//
//  URLSessionDataTaskProtocol.swift
//  SearchGitUsersMVC
//
//  Created by Leonir Alves Deolindo on 07/03/20.
//  Copyright © 2020 Leonir Deolindo. All rights reserved.
//

import Foundation

protocol URLSessionDataTaskProtocol {
    var state: URLSessionTask.State { get }
    
    func resume()
    func cancel()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}
