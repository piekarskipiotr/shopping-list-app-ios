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
    let amountOfDoneGroceries: Int
    let amountOfAllGroceries: Int
    let isArchived: Bool
    
    init(id: String = UUID().uuidString, name: String, amountOfDoneGroceries: Int = 0, amountOfAllGroceries: Int = 0, isArchived: Bool = false) {
        self.id = id
        self.name = name
        self.amountOfDoneGroceries = amountOfDoneGroceries
        self.amountOfAllGroceries = amountOfAllGroceries
        self.isArchived = isArchived
    }
}

