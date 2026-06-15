//
//  ItemDetailView.swift
//  ScavengerHunt
//
//  Created by Cemar on 2026-06-04.
//

import SwiftUI
import PhotosUI

struct ItemDetailView: View {
    @ObservedObject var viewModel: ScavengerViewModel
    let itemId: UUID
    
    // State to handle the photo picker
    @State private var selectedItem: PhotosPickerItem? = nil
    
    @State private var showCamera = false
    
    var item: ScavengerItem {
        viewModel.items.first(where: { $0.id == itemId }) ?? ScavengerItem(title: "Error", clue: "Not found")
    }
    
    var body: some View {
        VStack(spacing: 20) {
            
            
            
            Text(item.title)
                .font(.largeTitle)
                .bold()
            
            // Display the photo if it exists
            if let photo = item.photo {
                Image(uiImage: photo)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }
            

            
            Text("Clue:")
                .font(.headline)
            Spacer()

            Text(item.clue)
                .padding()
            
            Spacer()
            Button(action: { showCamera = true }) {
                Label("Take Photo", systemImage: "camera")
            }
            .sheet(isPresented: $showCamera) {
                CameraPicker(selectedImage: .init(get: { item.photo }, set: { newImage in
                    if let image = newImage { viewModel.updateItemPhoto(id: itemId, photo: image) }
                }))
            }
            
            Spacer()

            PhotosPicker(selection: $selectedItem, matching: .images) {
                Label("Select Photo", systemImage: "photo.badge.plus")
            }
            Spacer()

            // Button to toggle status
            Button(action: {
                viewModel.toggleFoundStatus(id: itemId)
            }) {
                Text(item.isFound ? "Found! (Tap to Unmark)" : "Mark as Found")
            }
            .scavengerButtonStyle(isFound: item.isFound)
        }
        .padding()
        .navigationTitle("Clue Detail")
        .onChange(of: selectedItem) { _, newItem in
            Task {
                if let newItem = newItem {
                    if let data = try? await newItem.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        viewModel.updateItemPhoto(id: itemId, photo: uiImage)
                    }
                }
            }
        }
    }
}

#Preview {
    let vm = ScavengerViewModel()
    // Get the ID of the first item in the mock data
    let firstItemId = vm.items.first?.id ?? UUID()
    return ItemDetailView(viewModel: vm, itemId: firstItemId)
}
