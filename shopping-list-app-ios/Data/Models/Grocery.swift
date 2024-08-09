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
    
    init(id: String = UUID().uuidString, shopingListId: String, name: String, isDone: Bool = false) {
        self.id = id
        self.shoppingListId = shopingListId
        self.name = name
        self.isDone = isDone
    }
}
