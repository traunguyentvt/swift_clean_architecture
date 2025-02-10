//
//  ErrorObject.swift
//  CleanArchitecture
//
//  Created by Trau Nguyen on 2/9/25.
//

import Foundation

struct ErrorObject: Codable, Error {
    var code: Int?
    var message: String?
    var errorType: String?
    
    enum CodingKeys: String, CodingKey {
        case code, message
        case errorType = "type"
    }
    
    init(code: Int? = nil, message: String? = nil, errorType: String? = nil) {
        self.code = code
        self.message = message
        self.errorType = errorType
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try? container.decodeIfPresent(Int.self, forKey: .code)
        self.message = try? container.decodeIfPresent(String.self, forKey: .message)
        self.errorType = try? container.decodeIfPresent(String.self, forKey: .errorType)
    }
}
