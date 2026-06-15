//
//  ScavengerViewModel.swift
//  ScavengerHunt
//
//  Created by Cemar on 2026-06-04.
//

import Foundation
import Combine
import UIKit

class ScavengerViewModel: ObservableObject {
    // List of scavenger hunt items that the UI will observe
    @Published var items: [ScavengerItem] = []
    
    init() {
        // Initialize the scavenger hunt with 10 items
        // for i in 1...10 {
        // items.append(ScavengerItem(title: "Item #\(i)", clue: "This is the clue for item \(i)"))
        // }
        items = [
                ScavengerItem(title: "The Coffee Bean", clue: "Find the hidden menu item behind the counter."),
                ScavengerItem(title: "Grand Theater", clue: "Look for the poster of the latest movie release."),
                ScavengerItem(title: "City Library", clue: "Check the shelf of the classic literature section."),
                ScavengerItem(title: "Main Street Bakery", clue: "Take a picture of the daily special cupcake."),
                ScavengerItem(title: "Riverside Park", clue: "Locate the bench near the big oak tree."),
                ScavengerItem(title: "City Museum", clue: "Find the painting from the 19th century."),
                ScavengerItem(title: "Tech Haven", clue: "Snap a photo of the retro computer on display."),
                ScavengerItem(title: "Flower Boutique", clue: "Find the roses by the entrance window."),
                ScavengerItem(title: "Old Station", clue: "Check the clock face on the main tower."),
                ScavengerItem(title: "Art Gallery", clue: "Look for the sculpture in the courtyard.")
            ]
    }
    
    // Calculated property to get the count of items marked as found
    var foundCount: Int {
        items.filter { $0.isFound }.count
    }
    
    // Logic to determine the discount based on the number of items found
    var discountCode: String {
        if foundCount == 10 {
            return "20% Discount + Grand Prize Entry!"
        } else if foundCount >= 7 {
            return "20% Discount"
        } else if foundCount >= 5 {
            return "10% Discount"
        } else {
            return "Keep searching!"
        }
    }
    
    // Function to toggle the found status of an item using its ID
    func toggleFoundStatus(id: UUID) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            // Toggles the boolean value (true -> false, false -> true)
            items[index].isFound.toggle()
        }
    }
    func updateItemPhoto(id: UUID, photo: UIImage) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            items[index].photo = photo
        }
    }
}
