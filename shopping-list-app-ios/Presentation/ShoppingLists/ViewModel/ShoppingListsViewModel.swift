//
//  ShoppingListsViewModel.swift
//  shopping-list-app-ios
//
//  Created by Piotr Piekarski on 02/08/2024.
//

import Foundation
import SwiftData

extension ShoppingListsView {
    
    @Observable
    class ShoppingListsViewModel: ObservableObject {
        var modelContext: ModelContext
        var shoppingLists = [ShoppingListModel]()
        
        
        init(modelContext: ModelContext) {
            self.modelContext = modelContext
            fetchData()
        }
        
        func fetchData() {
            do {
                let predicate = #Predicate<ShoppingListModel> {
                    $0.isArchived == false
                }
                let descriptor = FetchDescriptor<ShoppingListModel>(predicate: predicate, sortBy: [SortDescriptor(\.createdAt, order: .reverse)])
                shoppingLists = try modelContext.fetch(descriptor)
            } catch {
                print("Fetch failed")
            }
        }
        
        func addShoppingList(name: String) {
            modelContext.insert(ShoppingListModel(name: name))
            fetchData()
        }
        
        func deleteShoppingList(shoppingList: ShoppingListModel) {
            modelContext.delete(shoppingList)
            fetchData()
        }
    }
}
