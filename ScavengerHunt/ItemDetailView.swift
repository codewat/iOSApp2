//
//  ItemDetailView.swift
//  ScavengerHunt
//
//  Created by Cemar on 2026-06-04.
//

import SwiftUI

struct ItemDetailView: View {
    @ObservedObject var viewModel: ScavengerViewModel // Used to call the update function
    let itemId: UUID // I-pass lang ang ID
    var item: ScavengerItem {
        viewModel.items.first(where: { $0.id == itemId }) ?? ScavengerItem(title: "Error", clue: "Not found")
    }
    var body: some View {
        VStack(spacing: 20) {
            Text(item.title)
                .font(.largeTitle)
                .bold()
            
            Text("Clue:")
                .font(.headline)
            
            Text(item.clue)
                .padding()
            
            Spacer()
            
            // Button to mark item as found using the ViewModel function
            // In ItemDetailView.swift

            Button(action: {
                viewModel.toggleFoundStatus(id: itemId) // Call the toggle function
            }) {
                // Dynamic text based on current status
                Text(item.isFound ? "Found! (Tap to Unmark)" : "Mark as Found")
            }
            .scavengerButtonStyle(isFound: item.isFound)
        }
        .padding()
        .navigationTitle("Clue Detail")
    }
}

#Preview {
    let vm = ScavengerViewModel()
    // Get the ID of the first item in the mock data
    let firstItemId = vm.items.first?.id ?? UUID()
    return ItemDetailView(viewModel: vm, itemId: firstItemId)
}
