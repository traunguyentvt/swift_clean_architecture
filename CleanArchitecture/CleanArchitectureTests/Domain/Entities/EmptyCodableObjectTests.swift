//
//  EmptyCodableObjectTests.swift
//  CleanArchitectureTests
//
//  Created by Trau Nguyen on 2/10/25.
//

import Testing
@testable import CleanArchitecture

struct EmptyCodableObjectTests {
    
    @Test func init_returnExpectedValues() {
        // Arrange
        let emptyCodableObject = EmptyCodableObject()
        
        // Assert
        #expect(emptyCodableObject != nil)
    }
    
}
