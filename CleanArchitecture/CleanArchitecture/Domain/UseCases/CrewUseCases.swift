//
//  CrewsUseCases.swift
//  CleanArchitecture
//
//  Created by Trau Nguyen on 2/9/25.
//

import Foundation

struct CrewUseCases {
    private let crewRespository: CrewRepository
    
    init(crewRepository: CrewRepository) {
        self.crewRespository = crewRepository
    }
    
    func fetchCrews(completionHandler: @escaping(Result<[Crew], ErrorObject>) -> Void) {
        crewRespository.fetchCrews(completionHandler: completionHandler)
    }
}
