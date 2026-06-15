//
//  ContentView.swift
//  ScavengerHunt
//
//  Created by Cemar on 2026-06-04.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ScavengerViewModel()
    
    var body: some View {
        
        NavigationStack {
            VStack {
                // Here is your custom progress component
                ProgressButtonView(viewModel: viewModel)
                
                List(viewModel.items) { item in
                    NavigationLink(destination: ItemDetailView(viewModel: viewModel, itemId: item.id)) {
                        HStack {
                            Text(item.title)
                            Spacer()
                            if item.isFound {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                        }
                    }
                }
                
            }
            .navigationTitle("Scavenger Hunt")
        }
    }
}
#Preview {
    ContentView()
}
