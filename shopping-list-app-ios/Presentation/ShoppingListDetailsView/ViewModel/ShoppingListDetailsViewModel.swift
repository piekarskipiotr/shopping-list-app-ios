//
//  ShoppingListDetailsViewModel.swift
//  shopping-list-app-ios
//
//  Created by Piotr Piekarski on 13/08/2024.
//

import Foundation
import SwiftData

extension ShoppingListDetailsView {
    
    @Observable
    class ShoppingListDetailsViewModel: ObservableObject {
        var modelContext: ModelContext
        var shoppingList: ShoppingListModel
        var groceries = [Grocery]()
        
        init(modelContext: ModelContext, shoppingList: ShoppingListModel) {
            self.modelContext = modelContext
            self.shoppingList = shoppingList
            fetchData()
        }
        
        func fetchData() {
            do {
                let id = shoppingList.id
                let predicate = #Predicate<Grocery> {
                    $0.shoppingListId == id
                }
                let descriptor = FetchDescriptor<Grocery>(
                    predicate: predicate,
                    sortBy: [SortDescriptor(\.createdAt, order: .reverse)]
                )
                groceries = try modelContext.fetch(descriptor)
            } catch {
                print("Fetch failed: \(error.localizedDescription)")
            }
        }

        func toggleDone(grocery: Grocery) {
            do {
                grocery.isDone ? shoppingList.decreaseAmountOfDoneGroceries() : shoppingList.increaseAmountOfDoneGroceries()
                grocery.isDone.toggle()
                try modelContext.save()
            } catch {
                print("Failed to toggle grocery status: \(error)")
            }
        }


        func addGrocery(name: String) {
            modelContext.insert(Grocery(shopingListId: shoppingList.id, name: name))
            shoppingList.increaseAmountOfAllGroceries()
            fetchData()
        }
        
        func deleteGrocery(grocery: Grocery) {
            modelContext.delete(grocery)
            shoppingList.decreaseAmountOfAllGroceries()
            if (grocery.isDone) {
                shoppingList.decreaseAmountOfDoneGroceries()
            }
            
            fetchData()
        }
    }
}

