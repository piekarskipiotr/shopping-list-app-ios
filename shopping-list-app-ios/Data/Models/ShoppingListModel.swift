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
    let createdAt: Date
    
    init(id: String = UUID().uuidString, name: String, amountOfDoneGroceries: Int = 0, amountOfAllGroceries: Int = 0, createdAt: Date = Date()) {
        self.id = id
        self.name = name
        self.amountOfDoneGroceries = amountOfDoneGroceries
        self.amountOfAllGroceries = amountOfAllGroceries
        self.createdAt = createdAt
    }
    
    func isArchived() -> Bool {
        return amountOfDoneGroceries == amountOfAllGroceries && amountOfAllGroceries != 0
    }
    
    
    func increaseAmountOfAllGroceries() {
        amountOfAllGroceries = amountOfAllGroceries + 1
    }
    
    func decreaseAmountOfAllGroceries() {
        amountOfAllGroceries = amountOfAllGroceries - 1
    }
    
    func increaseAmountOfDoneGroceries() {
        amountOfDoneGroceries = amountOfDoneGroceries + 1
    }
    
    func decreaseAmountOfDoneGroceries() {
        amountOfDoneGroceries = amountOfDoneGroceries - 1
    }
}

