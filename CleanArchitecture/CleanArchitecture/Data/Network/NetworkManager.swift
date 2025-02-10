//
//  NetworkManager.swift
//  CleanArchitecture
//
//  Created by Trau Nguyen on 2/2/25.
//

import Foundation

final class NetworkManager<requestBody: Encodable, responseModel: Decodable> {
    
    init() {}
    
    func fetchCrews(networkRequest: NetworkRequest, completionHandler: @escaping (Result<responseModel, ErrorObject>) -> Void) {
        if let url = URL(string: networkRequest.path) {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            if !networkRequest.urlQueryParam.isEmpty {
                var queryItems: [URLQueryItem] = []
                for (key, value) in networkRequest.urlQueryParam {
                    queryItems.append(URLQueryItem(name: key, value: value))
                }
                if !queryItems.isEmpty {
                    components?.queryItems = queryItems
                }
            }
            
            var request = URLRequest(url: components?.url ?? url)
            request.httpMethod = networkRequest.httpType.rawValue
            if let body = networkRequest.requestBody as? requestBody {
                request.httpBody = try? JSONEncoder().encode(body)
            }
            request.timeoutInterval = TimeInterval(networkRequest.timeOut)
            
            for item in networkRequest.additionalHeaders {
                request.setValue(item.value, forHTTPHeaderField: item.key)
            }
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    let statusCode = (response as? HTTPURLResponse)?.statusCode
                    if let error = error {
                        let customError = ErrorObject(code: statusCode, message: error.localizedDescription)
                        return completionHandler(.failure(customError))
                    }
                    guard let data = data else {
                        let customError = ErrorObject(code: statusCode, message: "no data response")
                        return completionHandler(.failure(customError))
                    }
                    do {
                        let decodedData = try JSONDecoder().decode(responseModel.self, from: data)
                        completionHandler(.success(decodedData))
                    } catch (let error) {
                        let customError = ErrorObject(code: statusCode, message: error.localizedDescription)
                        completionHandler(.failure(customError))
                    }
                }
            }
            .resume()
        }
    }
    
}
