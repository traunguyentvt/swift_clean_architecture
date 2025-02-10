//
//  NetworkRequestPath.swift
//  CleanArchitecture
//
//  Created by Trau Nguyen on 2/2/25.
//

import Foundation

enum NetworkRequestPath {
    case listCrews
    
    func getHttpType() -> RequestType {
        switch self {
        case .listCrews:
            return .GET
        }
    }
    
    func getUrlPath() -> String {
        switch self {
        case .listCrews:
            return "https://api.spacexdata.com/v4/crew"
        }
    }
    
    func getUrlQueryParams() -> Params {
        switch self {
        default:
            return [:]
        }
    }
}
