//
//  URLSessionDataTaskMock.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import Foundation

@testable import ListPublicGists

class URLSessionDataTaskMock: URLSessionDataTaskProtocol {
    var state: URLSessionTask.State = .suspended
    
    func resume() { state = .running }
    func cancel() { state = .canceling }
}
