//
//  ServiceProvider.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import Foundation

class ServiceProvider {
    
    private var session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func request<T: Decodable>(target: ServiceTargetProtocol, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: API.baseURL)?.appendingPathComponent(target.path) else {
            completion(.failure(.network(.badURL)))
            return
        }
        
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            completion(.failure(.network(.badURL)))
            return
        }
        
        urlComponents.queryItems = target.parameters?.map({ URLQueryItem(name: $0.key, value: $0.value) })
        
        guard let componentURL = urlComponents.url else {
            completion(.failure(.network(.badURL)))
            return
        }
        
        let urlRequest = URLRequest(url: componentURL)
        
        let session = self.session.dataTask(request: urlRequest) { (data, response, error) in
            if let error = error as? URLError {
                completion(.failure(NetworkError(error)))
            }
            else if let response = response as? HTTPURLResponse,
               response.statusCode != 200 {
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
