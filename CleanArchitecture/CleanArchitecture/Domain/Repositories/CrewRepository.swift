//
//  CrewsRepository.swift
//  CleanArchitecture
//
//  Created by Trau Nguyen on 2/9/25.
//

import Foundation

protocol CrewRepository {
    func fetchCrews(completionHandler: @escaping(Result<[Crew], ErrorObject>) -> Void)
}
