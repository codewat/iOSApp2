//
//  ScavengerItem.swift
//  ScavengerHunt
//
//  Created by Cemar on 2026-06-04.
//

import Foundation
import UIKit

struct ScavengerItem: Identifiable {
    let id = UUID() // Unique identifier for each item
    let title: String
    let clue: String
    var isFound: Bool = false // Tracks if the item has been located
    var photo: UIImage?
}
