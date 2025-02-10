//
//  NetworkRequest.swift
//  CleanArchitecture
//
//  Created by Trau Nguyen on 2/2/25.
//

import Foundation

struct NetworkRequest: NetworkRequestProtocol {
    var requestPath: NetworkRequestPath
    var requestBody: Encodable?
    
    var httpType: RequestType {
        return requestPath.getHttpType()
    }
    
    var path: String {
        return requestPath.getUrlPath()
    }
    
    var urlQueryParam: Params {
        return requestPath.getUrlQueryParams()
    }
    
    var additionalHeaders: [String: String] {
        return headers
    }
}
