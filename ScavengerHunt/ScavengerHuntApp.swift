
//
//  ScavengerHuntApp.swift
//  ScavengerHunt
//
//  Created by Cemar on 2026-06-04.
//

import SwiftUI

@main
struct ScavengerHuntApp: App {
    @State private var showSplash = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                            ContentView()
                            
                            if showSplash {
                                SplashView()
                                    .transition(.opacity)
                            }
                        }
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    showSplash = false
                                }
                            }
                        }
                    }
                }
            }
