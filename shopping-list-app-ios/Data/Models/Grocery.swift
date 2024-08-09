//
//  Grocery.swift
//  shopping-list-app-ios
//
//  Created by Piotr Piekarski on 02/08/2024.
//

import Foundation
import SwiftData

@Model
final class Grocery {
    let id: String
    let shoppingListId: String
    let name: String
    let isDone: Bool
    let createdAt: Date
    
    init(id: String = UUID().uuidString, shopingListId: String, name: String, isDone: Bool = false, createdAt: Date = Date()) {
        self.id = id
        self.shoppingListId = shopingListId
        self.name = name
        self.isDone = isDone
        self.createdAt = createdAt
    }
}
