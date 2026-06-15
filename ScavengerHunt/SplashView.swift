//
//  SplashView.swift
//  ScavengerHunt
//
//  Created by Cemar on 2026-06-11.
//

import Foundation
import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500, height: 500)

            }
        }
    }
}
