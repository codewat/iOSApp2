//
//  ProgressButtonView.swift
//  ScavengerHunt
//
//  Created by Cemar on 2026-06-08.
//

import Foundation
import SwiftUI

struct ProgressButtonView: View {
    // We observe the ViewModel to get real-time updates
    @ObservedObject var viewModel: ScavengerViewModel
    
    var body: some View {
        HStack {
            Text("Items Found: \(viewModel.foundCount) / \(viewModel.items.count)")
                .font(.subheadline)
                .bold()
            
            Spacer()
            
            if !viewModel.discountCode.isEmpty {
                Text(viewModel.discountCode)
                    .font(.caption)
                    .padding(8)
                    .background(Color.yellow.opacity(0.2))
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}
