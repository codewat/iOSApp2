//
//  ScavengerViewModel.swift
//  ScavengerHunt
//
//  Created by Cemar on 2026-06-04.
//

import Foundation
import Combine

class ScavengerViewModel: ObservableObject {
    // List of scavenger hunt items that the UI will observe
    @Published var items: [ScavengerItem] = []
    
    init() {
        // Initialize the scavenger hunt with 10 items
        for i in 1...10 {
            items.append(ScavengerItem(title: "Item #\(i)", clue: "This is the clue for item \(i)"))
        }
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
}
