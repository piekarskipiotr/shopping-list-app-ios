//
//  ShoppingListModel.swift
//  shopping-list-app-ios
//
//  Created by Piotr Piekarski on 02/08/2024.
//

import Foundation
import SwiftData

@Model
final class ShoppingListModel {
    let id: String
    let name: String
    var amountOfDoneGroceries: Int
    var amountOfAllGroceries: Int
    let isArchived: Bool
    let createdAt: Date
    
    init(id: String = UUID().uuidString, name: String, amountOfDoneGroceries: Int = 0, amountOfAllGroceries: Int = 0, isArchived: Bool = false, createdAt: Date = Date()) {
        self.id = id
        self.name = name
        self.amountOfDoneGroceries = amountOfDoneGroceries
        self.amountOfAllGroceries = amountOfAllGroceries
        self.isArchived = isArchived
        self.createdAt = createdAt
    }
}

