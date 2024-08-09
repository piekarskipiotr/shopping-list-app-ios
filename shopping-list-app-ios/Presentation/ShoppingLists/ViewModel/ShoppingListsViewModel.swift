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
                let descriptor = FetchDescriptor<ShoppingListModel>(sortBy: [SortDescriptor(\.name)])
                shoppingLists = try modelContext.fetch(descriptor)
            } catch {
               print("Fetch failed")
            }
        }
        
        func addTestData() {
            modelContext.insert(ShoppingListModel(name: "Test"))
            fetchData()
        }
    }
}
