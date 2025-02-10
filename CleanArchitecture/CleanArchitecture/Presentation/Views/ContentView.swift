//
//  ContentView.swift
//  CleanArchitecture
//
//  Created by Trau Nguyen on 2/2/25.
//

import SwiftUI

struct ContentView: View {
    private let crewUseCases: CrewUseCases

    init(crewUseCases: CrewUseCases = CrewUseCases(crewRepository: CrewRepositoryImpl())) {
        self.crewUseCases = crewUseCases
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            crewUseCases.fetchCrews() { result in
                switch result {
                case .success(let crews):
                    print(crews)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
