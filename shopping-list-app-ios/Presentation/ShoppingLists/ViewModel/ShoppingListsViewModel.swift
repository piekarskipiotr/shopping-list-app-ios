//
//  ShoppingListsViewModel.swift
//  shopping-list-app-ios
//
//  Created by Piotr Piekarski on 02/08/2024.
//

import Foundation

class ShoppingListsViewModel: ObservableObject {
    @Published var items: [String] = ["Item 1", "Item 2", "Item 3"]
    
    func addItem(_ item: String) {
        items.append(item)
    }
}
