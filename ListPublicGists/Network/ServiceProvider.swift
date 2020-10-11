//
//  ServiceProvider.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import Foundation

class ServiceProvider {
    
    private var session: URLSessionProtocol
    private var api: APIProtocol
    
    init(session: URLSessionProtocol = URLSession.shared,
         api: APIProtocol = API()) {
        self.session = session
        self.api = api
    }
    
    func request<T: Decodable>(target: ServiceTargetProtocol, completion: @escaping (Result<T, NetworkError>) -> Void) {
        do {
            let urlRequest = try URLRequest(baseURL: api.baseURL, target: target)
            
            let session = self.session.dataTask(request: urlRequest) { (data, response, error) in
                if let error = error as? URLError {
                    completion(.failure(NetworkError(error)))
                }
                else if let response = response as? HTTPURLResponse,
                        !(200...300).contains(response.statusCode) {
                    completion(.failure(NetworkError(response)))
                } else {
                    guard let data = data else {
                        completion(.failure(.service(.noData)))
                        return
                    }
                    
                    do {
                        let decoded = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decoded))
                    } catch(let error) {
                        if let error = error as? DecodingError {
                            completion(.failure(NetworkError(error)))
                        }
                    }
                }
            }
            
            session.resume()
        } catch (let error) {
            guard let error = error as? NetworkError else {
                completion(.failure(.unknown))
                return
            }
            completion(.failure(error))
        }
    }
    
    private func errorNetwork(_ error: URLError) throws {
        
    }
    
    private func debugResponse(request: URLRequest, data: Data?) {
        print("==== REQUEST ====")
        print("\nURL: \(request.url?.absoluteString ?? "")")
        
        if let requestHeader = request.allHTTPHeaderFields {
            if let data = try? JSONSerialization.data(withJSONObject: requestHeader, options: .prettyPrinted) {
                print("\nHEADER: \(String(data: data, encoding: .utf8) ?? "")")
            }
        }
        
        print("\nMETHOD: \(request.httpMethod ?? "")")
        
        print("\n==== RESPONSE ====")
        if let data = data {
            if let jsonObject = try? JSONSerialization.jsonObject(with: data) {
                if let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) {
                    print(String(data: jsonData, encoding: .utf8) ?? "")
                }
            }
        }
        print("\n================\n")
    }
}

extension URLRequest {
    init(baseURL: String, target: ServiceTargetProtocol) throws {
        guard let url = URL(string: baseURL)?.appendingPathComponent(target.path) else {
            throw NetworkError.Network.badURL
        }
        
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            throw NetworkError.Network.badURL
        }
        
        urlComponents.queryItems = target.parameters?.map({ URLQueryItem(name: $0.key, value: $0.value) })
        
        guard let componentURL = urlComponents.url else {
            throw NetworkError.Network.badURL
        }
        
        self.init(url: componentURL)
    }
}
