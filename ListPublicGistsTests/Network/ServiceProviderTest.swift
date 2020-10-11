//
//  ServiceProviderTest.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import XCTest

@testable import ListPublicGists

class ServiceProviderTest: XCTestCase {
    
    struct DummyModel: Decodable {
        let name: String
    }
    
    enum DummyTarget: ServiceTargetProtocol {
        case dummy
        
        var path: String { "" }
        var method: HTTPMethod { .GET }
        var header: [String : String]? { nil }
        var parameters: [String : String]? { nil }
    }
    
    func test_request_withValidJsonAndRequestSuccess_shouldParseJsonSuccess() {
        let expectation = XCTestExpectation(description: "Request and parse json with success")
        
        let sut = makeServiveProvider(stub: (file: "network_valid_json",
                                             statusCode: 200),
                                      urlError: nil)
        
        sut.request(target: DummyTarget.dummy) { (result: Result<DummyModel, NetworkError>) in
            expectation.fulfill()
            
            switch result {
            case .success(let model):
                XCTAssertEqual(model.name, "user")
            default:
                XCTFail("Test valid json fail")
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_request_withValidJsonAndRequestSuccessAndStatusCode400_shouldReturnResponseErrorBadRequest() {
        let expectation = XCTestExpectation(description: "Request erro with statusCode = 400")
        
        let sut = makeServiveProvider(stub: (file: "network_valid_json",
                                             statusCode: 400),
                                      urlError: nil)
        
        sut.request(target: DummyTarget.dummy) { (result: Result<DummyModel, NetworkError>) in
            expectation.fulfill()
            
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .service(.badRequest))
            default:
                XCTFail("The network request finished with success. It didn't failure.")
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_request_withValidJsonAndRequestSuccessAndStatusCode401_shouldReturnResponseErrorUnauthorized() {
        let expectation = XCTestExpectation(description: "Request erro with statusCode = 401")
        
        let sut = makeServiveProvider(stub: (file: "network_valid_json",
                                             statusCode: 401),
                                      urlError: nil)
        
        sut.request(target: DummyTarget.dummy) { (result: Result<DummyModel, NetworkError>) in
            expectation.fulfill()
            
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .service(.unauthorized))
            default:
                XCTFail("The network request finished with success. It didn't failure.")
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_request_withValidJsonAndRequestSuccessAndStatusCode403_shouldReturnResponseErrorForbiden() {
        let expectation = XCTestExpectation(description: "Request erro with statusCode = 403")
        
        let sut = makeServiveProvider(stub: (file: "network_valid_json",
                                             statusCode: 403),
                                      urlError: nil)
        
        sut.request(target: DummyTarget.dummy) { (result: Result<DummyModel, NetworkError>) in
            expectation.fulfill()
            
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .service(.forbidden))
            default:
                XCTFail("The network request finished with success. It didn't failure.")
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_request_withValidJsonAndRequestSuccessAndStatusCode404_shouldReturnResponseErrorNotFound() {
        let expectation = XCTestExpectation(description: "Request erro with statusCode = 404")
        
        let sut = makeServiveProvider(stub: (file: "network_valid_json",
                                             statusCode: 404),
                                      urlError: nil)
        
        sut.request(target: DummyTarget.dummy) { (result: Result<DummyModel, NetworkError>) in
            expectation.fulfill()
            
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .service(.notFound))
            default:
                XCTFail("The network request finished with success. It didn't failure.")
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_request_withValidJsonAndRequestSuccessAndStatusCode408_shouldReturnResponseErrorRequestTimeout() {
        let expectation = XCTestExpectation(description: "Request erro with statusCode = 408")
        
        let sut = makeServiveProvider(stub: (file: "network_valid_json",
                                             statusCode: 408),
                                      urlError: nil)
        
        sut.request(target: DummyTarget.dummy) { (result: Result<DummyModel, NetworkError>) in
            expectation.fulfill()
            
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .service(.requestTimeout))
            default:
                XCTFail("The network request finished with success. It didn't failure.")
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_request_withValidJsonAndRequestSuccessAndStatusCode407_shouldReturnResponseErrorClientError() {
        let expectation = XCTestExpectation(description: "Request erro with statusCode = 407")
        
        let sut = makeServiveProvider(stub: (file: "network_valid_json",
                                             statusCode: 407),
                                      urlError: nil)
        
        sut.request(target: DummyTarget.dummy) { (result: Result<DummyModel, NetworkError>) in
            expectation.fulfill()
            
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .service(.clientError))
            default:
                XCTFail("The network request finished with success. It didn't failure.")
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_request_withValidJsonAndRequestSuccessAndStatusCode500_shouldReturnResponseErrorInternalServerError() {
        let expectation = XCTestExpectation(description: "Request erro with statusCode = 500")
        
        let sut = makeServiveProvider(stub: (file: "network_valid_json",
                                             statusCode: 500),
                                      urlError: nil)
        
        sut.request(target: DummyTarget.dummy) { (result: Result<DummyModel, NetworkError>) in
            expectation.fulfill()
            
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .service(.internalServerError))
            default:
                XCTFail("The network request finished with success. It didn't failure.")
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_request_withValidJsonAndRequestSuccessAndStatusCode600_shouldReturnResponseErrorUnknown() {
        let expectation = XCTestExpectation(description: "Request erro with statusCode = 600")
        
        let sut = makeServiveProvider(stub: (file: "network_valid_json",
                                             statusCode: 600),
                                      urlError: nil)
        
        sut.request(target: DummyTarget.dummy) { (result: Result<DummyModel, NetworkError>) in
            expectation.fulfill()
            
            switch result {
            case .failure(let error):
                guard case let NetworkError.service(.unknown(description)) = error else {
                    XCTFail("Error: description not found")
                    return
                }
                
                XCTAssertEqual(error, .service(.unknown(description)))
            default:
                XCTFail("The network request finished with success. It didn't failure.")
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_request_withEmptyJsonAndRequestSuccessAndStatusCode200_shouldReturnResponseErrorNoData() {
        let expectation = XCTestExpectation(description: "Request erro with statusCode = 500")
        
        let sut = makeServiveProvider(stub: (file: nil,
                                             statusCode: 200),
                                      urlError: nil)
        
        sut.request(target: DummyTarget.dummy) { (result: Result<DummyModel, NetworkError>) in
            expectation.fulfill()
            
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .service(.noData))
            default:
                XCTFail("The network request finished with success. It didn't failure.")
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_request_withValidJsonAndNetworkError_shouldReturnAPIRequestErrorCancelled() {
        let expectation = XCTestExpectation(description: "Network connection cancelled")
        
        let sut = makeServiveProvider(stub: nil,
                                      urlError: URLError(.cancelled))
        
        sut.request(target: DummyTarget.dummy) { (result: Result<DummyModel, NetworkError>) in
            expectation.fulfill()
            
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .network(.cancelled))
            default:
                XCTFail("The network request finished with success. It didn't failure.")
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_request_withValidJsonAndNetworkError_shouldReturnAPIRequestErrorConnectionLost() {
        let expectation = XCTestExpectation(description: "Network connection connection lost")
        
        let sut = makeServiveProvider(stub: nil,
                                      urlError: URLError(.networkConnectionLost))
        
        sut.request(target: DummyTarget.dummy) { (result: Result<DummyModel, NetworkError>) in
            expectation.fulfill()
            
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .network(.networkConnectionLost))
            default:
                XCTFail("The network request finished with success. It didn't failure.")
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_request_withValidJsonAndNetworkError_shouldReturnAPIRequestErrorBadURL() {
        let expectation = XCTestExpectation(description: "Network connection bad URL")
        
        let sut = makeServiveProvider(stub: nil,
                                      urlError: URLError(.badURL))
        
        sut.request(target: DummyTarget.dummy) { (result: Result<DummyModel, NetworkError>) in
            expectation.fulfill()
            
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .network(.badURL))
            default:
                XCTFail("The network request finished with success. It didn't failure.")
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_request_withValidJsonAndNetworkError_shouldReturnAPIRequestErrorTimeout() {
        let expectation = XCTestExpectation(description: "Network connection timeout")
        
        let sut = makeServiveProvider(stub: nil,
                                      urlError: URLError(.timedOut))
        
        sut.request(target: DummyTarget.dummy) { (result: Result<DummyModel, NetworkError>) in
            expectation.fulfill()
            
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .network(.timedOut))
            default:
                XCTFail("The network request finished with success. It didn't failure.")
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_request_withValidJsonAndNetworkError_shouldReturnAPIRequestErrorUnknown() {
        let expectation = XCTestExpectation(description: "Network connection connection lost")
        
        let sut = makeServiveProvider(stub: nil,
                                      urlError: URLError(.unknown))
        
        sut.request(target: DummyTarget.dummy) { (result: Result<DummyModel, NetworkError>) in
            expectation.fulfill()
            
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .network(.unknown("The operation couldn’t be completed. (NSURLErrorDomain error -1.)")))
            default:
                XCTFail("The network request finished with success. It didn't failure.")
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_request_withRequestSuccessAndNetworkOkAndJsonError_shouldReturnAPIRequestErrorTypeMismatch() {
        let expectation = XCTestExpectation(description: "Request success and Network Ok, but invalid json. Send Int but String expected. Should return error .typeMismatch")
        
        let sut = makeServiveProvider(stub: (file: "network_invalid_json_type_mismatch",
                                             statusCode: 200),
                                      urlError: nil)
        
        sut.request(target: DummyTarget.dummy) { (result: Result<DummyModel, NetworkError>) in
            expectation.fulfill()
            
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .parse(.typeMismatch(debugDescription: "Expected to decode String but found a number instead.")))
            default:
                XCTFail("The network request finished with success. It didn't failure.")
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_request_withRequestSuccessAndNetworkOkAndJsonError_shouldReturnAPIRequestErrorValueNotFound() {
        let expectation = XCTestExpectation(description: "Request success and Network Ok, but invalid json. Should return error .valueNotFound")
        
        let sut = makeServiveProvider(stub: (file: "network_invalid_json_value_not_found",
                                             statusCode: 200),
                                      urlError: nil)
        
        sut.request(target: DummyTarget.dummy) { (result: Result<DummyModel, NetworkError>) in
            expectation.fulfill()
            
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .parse(.valueNotFound(debugDescription: "Expected String value but found null instead.")))
            default:
                XCTFail("The network request finished with success. It didn't failure.")
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_request_withRequestSuccessAndNetworkOkAndJsonError_shouldReturnAPIRequestErrorKeyNotFound() {
        let expectation = XCTestExpectation(description: "Request success and Network Ok, but invalid json. Should return error .keyNotFound")
        
        let sut = makeServiveProvider(stub: (file: "network_invalid_json_key_not_found",
                                             statusCode: 200),
                                      urlError: nil)
        
        sut.request(target: DummyTarget.dummy) { (result: Result<DummyModel, NetworkError>) in
            expectation.fulfill()
            
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .parse(.keyNotFound(debugDescription: "No value associated with key CodingKeys(stringValue: \"name\", intValue: nil) (\"name\").")))
            default:
                XCTFail("The network request finished with success. It didn't failure.")
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_request_withRequestSuccessAndNetworkOkAndJsonError_shouldReturnAPIRequestErrorDataCorrupted() {
        let expectation = XCTestExpectation(description: "Request success and Network Ok, but invalid json. Should return error .dataCorrupted")
        
        let sut = makeServiveProvider(stub: (file: "network_invalid_json_data_corrupted",
                                             statusCode: 200),
                                      urlError: nil)
        
        sut.request(target: DummyTarget.dummy) { (result: Result<DummyModel, NetworkError>) in
            expectation.fulfill()
            
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .parse(.dataCorrupted(debugDescription: "The given data was not valid JSON.")))
            default:
                XCTFail("The network request finished with success. It didn't failure.")
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}

extension ServiceProviderTest {
    private func makeServiveProvider(stub: (file: String?,
                                            statusCode: Int)?,
                                     urlError: URLError?) -> ServiceProvider {
        let sessionMock = URLSessionMock(stub: stub,
                                         urlError: urlError)
        let sut = ServiceProvider(session: sessionMock)
        
        return sut
    }
}
