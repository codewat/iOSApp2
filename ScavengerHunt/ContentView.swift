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
                
                List(viewModel.items.indices, id: \.self) { index in
                    NavigationLink(destination: ItemDetailView(viewModel: viewModel, itemId: viewModel.items[index].id)) {
                        HStack {
                            Text(viewModel.items[index].title)
                            Spacer()
                            if viewModel.items[index].isFound {
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
