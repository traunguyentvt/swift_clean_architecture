//
//  CrewsRepositoryImpl.swift
//  CleanArchitecture
//
//  Created by Trau Nguyen on 2/9/25.
//

import Foundation

final class CrewRepositoryImpl: CrewRepository {
    init() {}
    
    func fetchCrews(completionHandler: @escaping(Result<[Crew], ErrorObject>) -> Void) {
        let networkRequest = NetworkRequest(requestPath: .listCrews)
        NetworkManager<EmptyCodableObject, [Crew]>().fetchCrews(networkRequest: networkRequest, completionHandler: completionHandler)
    }
}
