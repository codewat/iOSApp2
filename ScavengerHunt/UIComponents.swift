//
//  UIComponents.swift
//  ScavengerHunt
//
//  Created by Cemar on 2026-06-08.
//

import Foundation
import SwiftUI

// This is a custom button style so you don't have to repeat the code for every button
struct ScavengerButtonStyle: ViewModifier {
    var isFound: Bool
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding()
            .background(isFound ? Color.green : Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

// Extension to make it easier to apply
extension View {
    func scavengerButtonStyle(isFound: Bool) -> some View {
        self.modifier(ScavengerButtonStyle(isFound: isFound))
    }
}
