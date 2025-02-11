//
//  NetworkRequestProtocol.swift
//  CleanArchitecture
//
//  Created by Trau Nguyen on 2/2/25.
//

import Foundation

typealias Params = [String: String]

enum RequestType: String {
    case DELETE = "DELETE"
    case GET = "GET"
    case PATCH = "PATCH"
    case POST = "POST"
    case PUT = "PUT"
}

protocol NetworkRequestProtocol {
    var headers: Params { get }
    var httpType: RequestType { get }
    var path: String { get }
    var requestBody: Encodable? { get }
    var timeOut: Float { get }
    var urlQueryParam: Params { get }
}

extension NetworkRequestProtocol {
    var headers: Params {
        return [
            "Content-Type": "application/json"
        ]
    }
    
    var requestBody: Encodable? {
        return requestBody
    }
    
    var timeOut: Float {
        return 20.0
    }
    
    var urlQueryParam: Params {
        return [:]
    }
}
