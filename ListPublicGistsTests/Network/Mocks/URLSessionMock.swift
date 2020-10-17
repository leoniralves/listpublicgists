//
//  URLSessionMock.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import Foundation

@testable import ListPublicGists

class URLSessionMock: URLSessionProtocol {
    
    private let stub: (file: String?, statusCode: Int)?
    private let urlError: URLError?
    
    init(stub: (file: String?, statusCode: Int)?, urlError: URLError?) {
        self.stub = stub
        self.urlError = urlError
    }
    
    func dataTask(request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        completionHandler(loadJsonWith(name: stub?.file),
                          successHttpURLResponse(url: request.url!,
                                                 statusCode: stub?.statusCode),
                          urlError)
        return URLSessionDataTaskMock()
    }
    
    private func completionHandler() {
        
    }
    
    private func successHttpURLResponse(url: URL,
                                        statusCode: Int?) -> URLResponse? {
        guard let statusCode = statusCode else {
            return nil
        }
        
        return HTTPURLResponse(url: url,
                               statusCode: statusCode,
                               httpVersion: "HTTP/1.1",
                               headerFields: nil)!
    }
    
    private func loadJsonWith(name: String?) -> Data? {
        let bundle = Bundle(for: Self.self)
        guard let name = name,
              !name.isEmpty,
              let url = bundle.url(forResource: name, withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return nil
        }
        return data
    }
}
