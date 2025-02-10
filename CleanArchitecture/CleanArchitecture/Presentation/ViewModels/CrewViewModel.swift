//
//  CrewViewModel.swift
//  CleanArchitecture
//
//  Created by Trau Nguyen on 2/9/25.
//

import Foundation

final class CrewViewModel: ObservableObject {
    private let crewUseCases: CrewUseCases
    @Published var crews: [Crew] = []
    
    init(crewUseCases: CrewUseCases = CrewUseCases(crewRepository: CrewRepositoryImpl())) {
        self.crewUseCases = crewUseCases
    }
    
    func fetchCrews() {
        crewUseCases.fetchCrews() { [weak self] result in
            switch result {
            case .success(let crews):
                print(crews)
                self?.crews = crews
            case .failure(let error):
                print(error.message ?? error.localizedDescription)
            }
        }
    }
}
