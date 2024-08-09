//
//  ArchivedShoppingListsViewModel.swift
//  shopping-list-app-ios
//
//  Created by Piotr Piekarski on 09/08/2024.
//

import Foundation
import SwiftData

extension ArchivedShoppingListsView {
    
    @Observable
    class ArchivedShoppingListsViewModel: ObservableObject {
        var modelContext: ModelContext
        var archivedShoppingLists = [ShoppingListModel]()
        
        init(modelContext: ModelContext) {
            self.modelContext = modelContext
            fetchData()
        }
       
        func fetchData() {
            do {
                let predicate = #Predicate<ShoppingListModel> {
                            $0.isArchived == true
                        }
                let descriptor = FetchDescriptor<ShoppingListModel>(predicate: predicate, sortBy: [SortDescriptor(\.createdAt, order: .reverse)])
                archivedShoppingLists = try modelContext.fetch(descriptor)
            } catch {
               print("Fetch failed")
            }
        }
    }
}
