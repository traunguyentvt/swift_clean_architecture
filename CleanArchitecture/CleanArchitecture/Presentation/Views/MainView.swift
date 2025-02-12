//
//  MainView.swift
//  CleanArchitecture
//
//  Created by Trau Nguyen on 2/2/25.
//

import SwiftUI

struct MainView: View {
    @StateObject private var crewViewModel = CrewViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            crewViewModel.fetchCrews()
        }
    }
}

#Preview {
    MainView()
}
